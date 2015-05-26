/*
 * The default template for the app
 */
var React = require('react');

var Template =
  React.createClass({
    render:function(){
      return  (
        <div className="container">
          {this.props.children}
        </div>
        )
    }
  });
module.exports = Template;
