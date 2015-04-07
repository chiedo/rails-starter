var React = require('react');
var Wheel = require('./Wheel.react.jsx');

var Car = React.createClass({

  render: function() {
    return (
      <div className="car">
        A Car with the following wheels
        <ul>
          <Wheel />
          <Wheel />
          <Wheel />
          <Wheel />
        </ul>
      </div>
    );
  }

});

module.exports = Car;
