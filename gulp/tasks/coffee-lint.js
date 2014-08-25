/**
  Check coffeescript syntax.
*/

var gulp = require('gulp');
var coffeelint = require('gulp-coffeelint');
var handleErrors = require('../util/handleErrors');

gulp.task('coffee-lint', function () {
    gulp.src('client/javascript/**/*.coffee')
        .pipe(coffeelint())
        .on('error', handleErrors)
        .pipe(coffeelint.reporter())
});
