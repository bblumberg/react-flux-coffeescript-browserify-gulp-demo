/**
  Run all build tasks.
*/

var gulp = require('gulp');

gulp.task('build', [
  'browserify',
  'copy-bower-files',
  'copy-fontawesome-fonts',
  'copy-bootstrap-fonts',
  'copy-less',
  'copy-images',
  'copy-fonts',
  'coffee-lint',
  'copy-html'
]);
