/*
  Define CRUD controller actions.
*/

var Comment = require('../models/comment');

module.exports = {

  // GET localhost:3000/api/comments/:id
  getById: function(req, res) {
    Comment.find({ _id: req.params.id }, function(err, comment) {
      if (err) {
        res.json({error: 'Comment not found.'});
      } else {
        res.json(comment);
      }
    });
  },

  // GET localhost:3000/api/comments
  getAll: function(req, res) {
    Comment.find({}, function(err, comments) {
      if (err) {
        res.json({error: 'No Comments found: ' + err});
      } else {
        res.json(comments);
      }
    });
  },

  // POST localhost:3000/api/comments
  add: function(req, res) {
    var newComment = new Comment(req.body);
    newComment.save(function(err, comment) {
      if (err) {
        res.json({error: 'Error adding comment.'});
      } else {
        res.json(comment);
      }
    });
  },

  // PUT localhost:3000/api/comments/:id
  update: function(req, res) {
    Comment.update({ _id: req.params.id }, req.body, function(err, updated) {
      if (err) {
        res.json({error: 'Comment not updated: ' + err});
      } else {
        res.json(200, {status: 'Success'});
      }
    })
  },

  // DELETE localhost:3000/api/comments/:id
  delete: function(req, res) {
    Comment.remove({ _id: req.params.id }, function(err, comment) {
      if (err) {
        res.json({error: 'Comment not found.'});
      } else {
        res.json(200, {status: 'Success'});
      }
    });
  }
};
