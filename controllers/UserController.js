const db = require("../database");
const { createToken } = require("../helpers/jwt");
const bcrypt = require("bcrypt");

class UserController {
  static login(req, res) {
    const { user, password } = req.body;
    // const unique_id = Date.now().toString().slice(0, 8);

    const query = `
        SELECT * FROM users 
        WHERE username=${db.escape(user)} OR email=${db.escape(user)}`;

    db.query(query, (err, data) => {
      if (err) return res.status(500).send(err);

      if (data.length === 0)
        return res
          .status(400)
          .json({ msg: "Invalid username / email / password" });

      const isPassword = bcrypt.compareSync(password, data[0].password);

      if (isPassword) {
        const user = { uid: data[0].uid, role: 2 }; //role masih default
        const token = createToken(user);
        res.status(200).json({ ...data[0], token });
      } else {
        res.status(400).json({ msg: "Invalid username / email / password" });
      }
    });
  }

  static register(req, res) {
    const { username, email } = req.body;
    const unique_id = Date.now().toString().slice(0, 8);
    const hashPass = bcrypt.hashSync(req.body.password, 10);

    const query = `
            INSERT INTO users (uid, username, password, email) 
            VALUES 
            (${db.escape(unique_id)}, ${db.escape(username)}, ${db.escape(
      hashPass
    )}, ${db.escape(email)})`;

    db.query(query, (err, data) => {
      if (err) return res.status(500).send(err);

      const user = { uid: unique_id, role: 2 }; //role masih default
      const token = createToken(user);

      res.status(201).json({
        id: data.insertId,
        uid: unique_id,
        username,
        email,
        status: 1,
        role: 2,
        token,
      });
      // db.query()
    });
  }

  static deactive(req, res) {
    const { uid } = req.user;
    const query = `UPDATE users SET status=2 WHERE uid=${db.escape(uid)}`;

    const queryGet = `SELECT (status) FROM users WHERE uid=${db.escape(uid)}`;

    db.query(queryGet, (err, data) => {
      const { status } = data[0];

      if (status === 1) {
        const query = `UPDATE users SET status=1 WHERE uid=${db.escape(uid)}`;

        db.query(query, (err2, data) => {
          if (err2) return res.status(500).send(err2);

          res.status(200).json({
            uid,
            status: "active",
          });
        });
      } else if (status === 3){
          res.status(400).json({ msg: "Account is Closed!" });
      } else {
          res.status(400).json({ msg: "Account is already deactivated!" });
      }
    });

    db.query(query, (err, data) => {
      if (err) return res.status(500).send(err);

      res.status(200).json({
        uid,
        status: "not-active",
      });
    });
  }

  static activate(req, res) {
    const { uid } = req.user;
    const queryGet = `SELECT (status) FROM users WHERE uid=${db.escape(uid)}`;

    db.query(queryGet, (err, data) => {
      if (err) return res.status(500).send(err);

      const { status } = data[0];

      if (status === 2) {
        const query = `UPDATE users SET status=1 WHERE uid=${db.escape(uid)}`;

        db.query(query, (err2, data) => {
          if (err2) return res.status(500).send(err2);

          res.status(200).json({
            uid,
            status: "active",
          });
        });
      } else if (status === 3) {
        res.status(400).json({ msg: "Account is Closed!" });
      } else {
        res.status(400).json({ msg: "Account is already Activated!" });
      }
    });
  }

  static close(req, res) {
    const { uid } = req.user;
    const query = `UPDATE users SET status=3 WHERE uid=${db.escape(uid)}`;

    db.query(query, (err, data) => {
      if (err) return res.status(500).send(err);

      res.status(200).json({
        uid,
        status: "close",
      });
    });
  }
}

module.exports = UserController;
