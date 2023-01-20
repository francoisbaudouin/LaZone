const express = require("express");
const app = express();
const cors = require("cors");
const PORT = process.env.PORT || 8080;
const authRouter = require('./api/routes/auth.routes');

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

//routes
app.use('/auth', authRouter);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
