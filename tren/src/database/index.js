const mysql = require("mysql");

const db = mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "",
    database: "complexivo",
});

db.connect((err)=>{
    if(err){
        console.log(err);
        return;
    }
    console.log('conection successfully...')
});

module.exports =db;