/** @jsx React.DOM */
var namespace = reactFunctions.setNamespace(COMPONENTS + ".car");

namespace.car =
  React.createClass({
    render:function(){
      return <h1>Car: {this.props.name} With the following Wheels: <cars.components.car.wheel/></h1>
    }
  });
