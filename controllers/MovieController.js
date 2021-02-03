const db = require("../database");
const url = require("url");

class MovieController {
  static getMovies(req, res) {
    const query = `SELECT * FROM movies`;

    db.query(query, (err, data) => {
      if (err) return res.status(500).send(err);

      res.status(200).json(data);
    });
  }

  static getMovie(req, res) {
    /*SQL 
      SELECT * FROM schedules sc 
      INNER JOIN movies m on sc.movie_id = m.id 
      INNER JOIN show_times st on sc.time_id = st.id 
      INNER JOIN locations l on sc.location_id = l.id
      */
    let selectQuery = `SELECT movie_id, name, release_date, release_month, release_year, duration_min, genre, description, location, time FROM schedules sc`;
    let joinMovies = ` INNER JOIN movies mv on sc.movie_id = mv.id `;
    let joinTimes = ` INNER JOIN show_times st on sc.time_id = st.id `;
    let joinLocations = ` INNER JOIN locations l on sc.location_id = l.id`;
    let joinStatus = ` INNER JOIN movie_status`;
    let conditional = ` `;

    let queryUrl = {};
    // for (const key in req.query) {
    //   queryUrl[key] = req.query[key].replace("%", " ");
    //   conditional += `${key}=${db.escape(queryUrl[key])}`;
    // }
    const querySQL =
      selectQuery +
      joinMovies +
      joinTimes +
      joinLocations +
      joinStatus +
      conditional;
    console.log(querySQL);

    db.query(querySQL, (err, data) => {
      if (err) return res.status(500).send(err);

      res.status(200).json(data);
    });
  }

  static add(req, res) {
    const data = req.body;

    let values = "";
    for (const key in data) {
      if (typeof data[key] === "string") {
        values += `${db.escape(data[key])}, `;
      } else {
        values += `${data[key]}, `;
      }
    }
    values = values.slice(0, -2);
    const insertQuery = `
        INSERT INTO 
        movies 
        (name, release_date, release_month, release_year, duration_min, genre, description)
        VALUES
        (${values})
        `;
    db.query(insertQuery, (err, dataRes) => {
      if (err) return res.status(500).send(err);

      const result = { id: dataRes.insertId, ...data };

      res.status(201).json(result);
    });
  }

  static edit(req, res) {
    const { role } = req.user;

    if (role === 2) {
      return res.status(404).json({ msg: "Authorization error. Only admin" });
    }

    const { status } = req.body;
    const id = parseInt(req.params.id);

    const updateQuery = `UPDATE movies SET status=${status} WHERE id=${id}`;

    db.query(updateQuery, (err, data) => {
      if (err) return res.status(500).send(err);

    //   console.log(data);
    res.status(200).json({
        id, message: 'status has been changed.'
    })
    });
  }

  static set(req, res) {
    const { role } = req.user;
    if (role === 2) {
      return res.status(404).json({ msg: "Authorization error. Only admin" });
    }

    const movie_id = parseInt(req.params.id)
    const location_id = parseInt(req.body.location_id)
    const time_id = parseInt(req.body.time_id)

    const insertQuery = `
        INSERT INTO 
        schedules 
        (location_id, time_id, movie_id) 
        VALUES 
        (${location_id}, ${time_id}, ${movie_id})`;

    db.query(insertQuery, (err, data) => {
        if (err) return res.status(500).send(err);

        console.log(data)
        res.status(201).json({
            id: movie_id,
            message: 'schedule has been added.'
        })
    })
  }
}

module.exports = MovieController;
