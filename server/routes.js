/*
  Set up routes for mock API.
*/

var comments = require('./controllers/comment');

module.exports.init = function(app, router) {
  router.get('/', function(req, res) {
    res.json({ message: 'hooray! welcome to our api!' });
  });

  // Comment API endpoints
  router.get('/comment', comments.getAll);
  router.get('/comment/:id', comments.getById);
  router.post('/comment', comments.add);
  router.put('/comment/:id', comments.update);
  router.delete('/comment/:id', comments.delete);

  app.use('/api', router);
};

