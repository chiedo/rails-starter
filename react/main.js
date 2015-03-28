/** @jsx React.DOM */
var Car = require('./components/Car.react');
var React = require('react');
window.React = React; // export for http://fb.me/react-devtools

React.render(
  <Car />,
  document.getElementById('react-car')
)
