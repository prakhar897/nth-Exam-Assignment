const mysql = require('mysql');

const config = {
    host: 'localhost',
    user: 'root',
    password: 'prakharprakhar',
    database: 'sampleDb',
};

const pool = mysql.createPool(config);
module.exports = pool;