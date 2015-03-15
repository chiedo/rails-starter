/** @jsx React.DOM */
var Car =
  React.createClass({
  render:function(){
    return <h1>Car: {this.props.name} With the following Wheels: <Wheel/></h1>
  }
});
