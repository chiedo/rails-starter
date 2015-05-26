/*
 * The home page
 */
var React          = require('react');
var Car            = require('../vehicles/Car.js');

var CarPage =
  React.createClass({
    render:function(){
      return  (
        <Car />
      )
    }
  });
module.exports = CarPage;
