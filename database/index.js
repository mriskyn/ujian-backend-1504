const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  port: 8889,
  user: "root",
  password: "root",
  database: "backend_2021",
});

module.exports = connection;
