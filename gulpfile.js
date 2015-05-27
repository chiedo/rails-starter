var gulp       = require('gulp');
var source     = require('vinyl-source-stream'); // Used to stream bundle for further handling
var browserify = require('browserify');
var watchify   = require('watchify');
var reactify   = require('reactify');
var concat     = require('gulp-concat');
 
gulp.task('browserify', function() {
  var bundler = browserify({
    entries: ['./react/app.js'], // Only need initial file, browserify finds the deps
    transform: [reactify], // We want to convert JSX to normal javascript
    debug: true, // Gives us sourcemapping
    cache: {}, packageCache: {}, fullPaths: true // Requirement of watchify
  });
  var watcher  = watchify(bundler);

  return watcher
  .on('update', function () { // When any files update
    var updateStart = Date.now();
    console.log('Updating!');
    watcher.bundle() // Create new bundle that uses the cache for high performance
    .pipe(source('react-bundle.js'))
    // This is where you add uglifying etc.
    .pipe(gulp.dest('./app/assets/javascripts/'));
    console.log('Updated!', (Date.now() - updateStart) + 'ms');
  })
  .bundle() // Create the initial bundle when starting the task
  .pipe(source('react-bundle.js'))
  .pipe(gulp.dest('./app/assets/javascripts'));
});

// Just running the two tasks
gulp.task('default', ['browserify']);
