var React = require('react');

var Bus = React.createClass({

  render: function() {
    return (
      <div className="bus">
        { this.props.name } without wheels.
      </div>
    );
  }
});

module.exports = Bus;
