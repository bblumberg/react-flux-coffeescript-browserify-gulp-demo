/*
  Express server setup
*/

var express = require('express'),
  logger = require('morgan'),
  bodyParser = require('body-parser'),
  util = require("util"),
  app = express(),
  port = process.env.PORT || 3300,
  router = express.Router(),
  routes = require('./routes'),
  db = require("./db");

// CORS middleware
// source -- http://stackoverflow.com/questions/7067966/how-to-allow-cors-in-express-nodejs
var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();

    // intercept OPTIONS method
    // if ('OPTIONS' == req.method) {
    //   res.send(200);
    // }
    // else {
    //   next();
    // }
};

var log = function(msg, obj) {
  return console.log(msg + util.inspect(obj));
};

// Route middleware that will happen on every request.
router.use(function(req, res, next) {
  // set header on each request to the console.
  res.setHeader('Content-Type', 'application/json');
  // continue doing what we were doing and go to the route.
  next();
});

app.use('/', express.static(__dirname));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(logger('dev'));
app.use(allowCrossDomain);

// initialize routes
routes.init(app, router);

app.listen(3001);

module.exports = app;

