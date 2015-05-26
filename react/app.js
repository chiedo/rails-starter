/*
 * The entry point for the react application.
 */
var React           = require('react');
var App             = require('./components/RailsStarterApp.js');
var Router          = require('react-router');
var Route           = Router.Route;
var DefaultRoute    = Router.DefaultRoute;
var NotFoundRoute   = Router.NotFoundRoute;

var NotFoundPage = require('./components/pages/NotFoundPage.js');
var HomePage     = require('./components/pages/HomePage.js');
var CarPage      = require('./components/pages/CarPage.js');
var BusPage      = require('./components/pages/BusPage.js');

// See https://github.com/rackt/react-router/blob/master/docs/guides/overview.md for explanation of nested routes
// if needed
var routes = (
  <Route handler={App}>
    <DefaultRoute handler={HomePage} />
    <Route name="home" path="/" handler={HomePage} />
    <Route name="car" path="/car" handler={CarPage} />
    <Route name="bus" path="/bus" handler={BusPage} />
    <NotFoundRoute handler={NotFoundPage} />
  </Route>
);

Router.run(routes, Router.HistoryLocation, function (Handler) {
  React.render(<Handler/>, document.getElementById('react-app'));
});
