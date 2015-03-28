var gulp = require('gulp');
var browserify = require('gulp-browserify');
var concat = require('gulp-concat');

gulp.task('browserify', function() {
  gulp.src('main.js')
  .pipe(browserify({transform: 'reactify'}))
  .pipe(concat('react-bundle.js'))
  .pipe(gulp.dest('../app/assets/javascripts'));
});

gulp.task('default',['browserify']);

gulp.task('watch', function() {
  gulp.watch(["main.js"], ['default']);
});
