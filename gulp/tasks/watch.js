/*
  Watch for changes in the sass, images, and html directories and run respective task.
  The browserify task already watches for changes in the client code.
  NOTE: The browserify gulp task already handles js recompiling with watchify
  so we don't need to watch it here.
*/

var gulp = require('gulp');

gulp.task('watch', ['setWatch', 'browserSync'], function() {
  gulp.watch('client/less/**', ['copy-less']);
  gulp.watch('client/fonts/**', ['copy-fonts']);
  gulp.watch('client/images/**', ['copy-images']);
  gulp.watch('client/index.html', ['copy-html']);
});
