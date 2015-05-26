var gulp = require('gulp');
var browserify = require('gulp-browserify');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');

gulp.task('browserify', function() {
  gulp.src('./react/app.js')
  .pipe(browserify({transform: 'reactify'}))
  .pipe(concat('react-bundle.js'))
  // Only use uglify for production build. It's much slower
  //.pipe(uglify())
  .pipe(gulp.dest('./app/assets/javascripts'));
});

gulp.task('default',['browserify', 'watch']);

gulp.task('watch', function() {
  gulp.watch(['./react/**/*'], ['browserify']);
});
