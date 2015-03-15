/** @jsx React.DOM */
var namespace = reactFunctions.setNamespace("car_shop.components.car.car");

namespace.car =
  React.createClass({
  render:function(){
    return <h1>Car: {this.props.name} With the following Wheels: <car_shop.components.car.wheel.wheel/></h1>
  }
});
