// Require packages and set the port
const express = require('express');
const port = 3002;
const bodyParser = require('body-parser');
const routes = require('./routes/routes')
const app = express();

// Use Node.js body parsing middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true,
}))

routes(app);

const server = app.listen(port, (error) =>{
    if (error) return console.log(`Server listening on port ${server.address().port}`);
});