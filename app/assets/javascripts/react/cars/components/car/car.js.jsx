/** @jsx React.DOM */
var namespace = reactFunctions.setNamespace("cars.components.car.car");

namespace.car =
  React.createClass({
  render:function(){
    return <h1>Car: {this.props.name} With the following Wheels: <cars.components.car.wheel.wheel/></h1>
  }
});
