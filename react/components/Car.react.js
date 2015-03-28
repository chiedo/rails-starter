/** @jsx React.DOM */
var Wheel = require('./Wheel.react');
var React = require('react');

var Car = React.createClass({

  render: function() {
    return (
      <div className="the-car">
        Car
        <Wheel />
      </div>
    );
  }

});

module.exports = Car;
