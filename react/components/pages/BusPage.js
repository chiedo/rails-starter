/*
 * The home page
 */
var React          = require('react');
var Bus            = require('../vehicles/Bus.js');

var BusPage =
  React.createClass({
    render:function(){
      return  (
        <Bus />
      )
    }
  });
module.exports = BusPage;
