'use strict';

// Credits to https://github.com/gulpjs/gulp/blob/master/docs/recipes/fast-browserify-builds-with-watchify.md

var watchify   = require('watchify');
var browserify = require('browserify');
var gulp       = require('gulp');
var source     = require('vinyl-source-stream');
var buffer     = require('vinyl-buffer');
var gutil      = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');
var assign     = require('lodash.assign');
var reactify   = require('reactify');
var uglify     = require("gulp-uglify");

// add custom browserify options here
var customOpts = {
  entries: ['./react/app.js'],
  transform: [
    ["reactify", {"es6": true}]
  ], // We want to convert JSX to normal javascript and es6 to es5
  debug: true
};
var opts = assign({}, watchify.args, customOpts);

var production = browserify(opts); 
gulp.task('production', bundleProduction);
production.on('log', gutil.log); // output build logs to terminal

var development = watchify(browserify(opts)); 
gulp.task('development', bundleDevelopment);
development.on('update', bundleDevelopment); // on any dep update, runs the bundler
development.on('log', gutil.log); // output build logs to terminal

function bundleDevelopment() {
  return development.bundle()
    // log errors if they happen
    .on('error', function(err){
      console.log(err.message);
    })
    .pipe(source('react-bundle.js'))
    // optional, remove if you don't need to buffer file contents
    .pipe(buffer())
    // optional, remove if you dont want sourcemaps
    .pipe(sourcemaps.init({loadMaps: true})) // loads map from browserify file
       // Add transformation tasks to the pipeline here.
    .pipe(sourcemaps.write('./')) // writes .map file
    .pipe(gulp.dest('./app/assets/javascripts'));
}

function bundleProduction() {
  return production.bundle()
    // log errors if they happen
    .on('error', function(err){
      console.log(err.message);
    })
    .pipe(source('react-bundle.js'))
    // optional, remove if you don't need to buffer file contents
    .pipe(buffer())
    .pipe(uglify())
    .pipe(gulp.dest('./app/assets/javascripts'));
}

gulp.task('default', ['development']);

