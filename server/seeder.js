/*
  Seed mongoDB if none exists.
*/

var mongoose = require('mongoose'),
  Comment = require('./models/comment.js');

module.exports = {
  check: function() {
    Comment.find({}, function(err, comments) {
      if (comments.length === 0) {
        console.log('no comments found, seeding...');

        var newComment1 = new Comment({
          author: 'jkat98@gmail.com',
          text: "lala"
        });
        newComment1.save(function(err, comment) {
          console.log('successfully inserted comment: ' + comment._id);
        });

        var newComment2 = new Comment({
          author: 'testerson@example.com',
          text: "hehe"
        });
        newComment2.save(function(err, comment) {
          console.log('successfully inserted comment: ' + comment._id);
        });

        var newComment3 = new Comment({
          author: 'nancy@testerson.com',
          text: "haha"
        });
        newComment3.save(function(err, comment) {
          console.log('successfully inserted comment: ' + comment._id);
        });

      } else {
        console.log('found ' + comments.length + ' existing comments!');
      }
    });
  }
};
