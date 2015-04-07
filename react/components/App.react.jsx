/** @jsx React.DOM */
var React = require('react');
var Car = require('./Car.react.jsx');
var Bus = require('./Bus.react.jsx');
var Router = require('react-router-component');

var Locations = Router.Locations;
var Location = Router.Location;

var App =
  
  React.createClass({
    render:function(){
      return (
          <Locations>
            <Location path="/react-car" handler={Car} />
            <Location path="/react-bus" handler={Bus} />
          </Locations>
        )
    }
});

module.exports = App;
