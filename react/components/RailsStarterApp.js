var React        = require('react');
var Template     = require('./layouts/Base.js');
var Router       = require('react-router');
var RouteHandler = Router.RouteHandler;

var App =
  
  React.createClass({
    render:function(){
      return (
        <Template>
          <RouteHandler />
        </Template>
        )
    }
});

module.exports = App;
