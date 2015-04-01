var gulp = require('gulp');
var browserify = require('gulp-browserify');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');

gulp.task('browserify', function() {
  gulp.src('main.jsx')
  .pipe(browserify({transform: 'reactify'}))
  .pipe(concat('react-bundle.js'))
  //.pipe(uglify())
  .pipe(gulp.dest('../app/assets/javascripts'));
});

gulp.task('default',['browserify']);

gulp.task('watch', function() {
  gulp.watch(['**/*.*'], ['browserify']);
});
