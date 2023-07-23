require("dotenv").config();
 
const db = require("./db");

// db.connect().then((client) => client.release());

db.selectCadCli();

