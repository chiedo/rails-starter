/** @jsx React.DOM */
var React = require('react');

// For each component that you want to be accessible to your views, you need to do the following. This just allows more components to be used on a page by page basis. I wrapped each React.Render call in a conditional to make sure the element with the needed ID exists first before attempting to render the element to render the element.

// Example 1
var Car = require('./components/Car.react');
if(document.getElementById('react-car') !== null) {
  React.render(
    <Car />,
    document.getElementById('react-car')
  )
}

// Example 2
var Bus = require('./components/Bus.react');
if(document.getElementById('react-bus') !== null) {
  React.render(
    <Bus />,
    document.getElementById('react-bus')
  )
}
