const express = require("express");
const app = express();
const cors = require("cors");
const about_json = require('../about.json')
const PORT = process.env.PORT || 8080;

var corsOptions = {
  origin: "http://localhost:8080"
};

app.use(cors(corsOptions));
// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.send("Hello world !");
});

app.get('/about.json', (req, res) => {
  res.json(about_json);
})

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
