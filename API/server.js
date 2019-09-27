const express = require("express");
const app = express();
const mysql = require("mysql");
const morgan = require("morgan");
const helmet = require("helmet");
const fs = require("fs");
require("dotenv").config();

const accessLogStream = fs.createWriteStream("morgan.log", { flags: "a" });

app.use(morgan("combined", { stream: accessLogStream }));
app.use(helmet());

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE
});

connection.connect(err => {
  if (err) throw err;
  console.log("Connected!");
});

//  GET all values of Products table & LEFT JOIN on Prices table to get it's values by using the foreign key.

app.get("/products", (req, res) => {
  const productsQuery =
    "SELECT Products.*, Prices.Price, Prices.Tax FROM Products LEFT JOIN Prices ON Products.Products_Id = Prices.Prices_Id;";
  connection.query(productsQuery, (err, rows) => {
    if (err) throw err;
    res.send(rows);
  });
});

// GET the

app.get("/products/category/:category", (req, res) => {
  const category = req.params.category;
  const filterQuery =
    "SELECT Products.*, Prices.Price, Prices.Tax FROM Products LEFT JOIN Prices ON Products.Products_Id = Prices.Prices_Id WHERE Products.Category = ?";
  connection.query(filterQuery, [category], (err, rows) => {
    if (err) throw err;
    res.send(rows);
  });
});

// GET all values of the Contacts table.

app.get("/contacts", (req, res) => {
  connection.query("SELECT * FROM  Contacts", (err, rows) => {
    if (err) throw err;
    res.send(rows);
  });
});

app.listen(3001, () => {
  console.log("Listening on port 3001");
});
