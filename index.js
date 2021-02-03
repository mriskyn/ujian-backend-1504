const express = require("express");
const cors = require("cors");
const bodyparser = require("body-parser");

const db = require("./database");
const router = require('./routers');

// main app
const app = express();

// apply middleware
app.use(cors());
app.use(bodyparser.json());

db.connect((err) => {
  if (err) return console.log(`error connecting : ${err.stack}`);
  console.log(`connected as id : ${db.threadId}`);
});

// main route
const response = (req, res) =>
  res.status(200).send("<h1>REST API JCWM1504</h1>");
app.get("/", response);

app.use(router);

// bind to local machine
const PORT = process.env.PORT || 2000;
app.listen(PORT, () => `CONNECTED : port ${PORT}`);
