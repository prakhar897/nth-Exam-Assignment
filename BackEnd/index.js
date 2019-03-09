// Require packages and set the port
const express = require('express');
const port = 3000;
const app = express();
const redis = require('redis')
const client = redis.createClient();
const routes = require('./App/Routes/routes');

routes(app,client);
 
// Start the server
const server = app.listen(port, (error) => {
    if (error) return console.log(`Error: ${error}`);
 
    console.log(`Server listening on port ${server.address().port}`);
});