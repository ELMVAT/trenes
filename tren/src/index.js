const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const path = require("path");

const app = express();
require("./database/index");

app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());
app.use(cors());

const port = 8082;

app.set("port", port);

//routes
app.use(require("./routes/index"))

app.listen(app.get("port"), () => {
    console.log(`server listen on port ${app.get("port")}`);
});
