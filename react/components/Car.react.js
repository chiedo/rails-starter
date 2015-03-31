/** @jsx React.DOM */
var Wheel = require('./Wheel.react');
var React = require('react');

var Car = React.createClass({

  render: function() {
    return (
      <div className="car">
        A {this.props.name} with the following wheels
        <ul>
          <li>
            <Wheel />
          </li>
          <li>
            <Wheel />
          </li>
          <li>
            <Wheel />
          </li>
          <li>
            <Wheel />
          </li>
      </ul>
      </div>
    );
  }

});

module.exports = Car;
