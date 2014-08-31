var mongoose = require('mongoose'),
    seeder = require('./seeder');

//connect to the db server
mongoose.connect('mongodb://localhost/MyApp');
mongoose.connection.on('open', function() {
  console.log("Connected to Mongoose...");

  // check if the db is empty, if so seed it.
  seeder.check();
});

