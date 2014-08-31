/*
  Define mongoDB schema for Comments.
*/

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var Comment = new Schema({
  author:      { type: String },
  text:   { type: String }
});

module.exports = mongoose.model('Comment', Comment);
