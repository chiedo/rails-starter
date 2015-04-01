var React = require('react');
window.React = React; // This makes sure react is global and gets rid of the need to include react in the application.js file

// For each component that you want to be accessible to your views, you need to do the following. This just allows more components to be used in a modular fashion. You will notice that usual there would be a React.createClass(...) function for each component. We are using the react-rails render_component helper instead in each view so we will lean on that instead. Because of this, we will also need to rely on react_ujs being in the application.js file.

// Example 1
var Car = require('./components/Car.react.jsx');
window.Car = Car; // makes it accessible to globally which is needed for React-rails

// Example 2
var Bus = require('./components/Bus.react.jsx');
window.Bus = Bus;
