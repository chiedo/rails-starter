Reactjs
=========
Notes
------------
This is not to demostrate how to create a reactjs app. This to show you how to connect a Reactjs app into your rails project. You at this point, would be free to set up the Flux Architecture, etc. an set up your project. If you end up using a javascript router, be sure to turn off turbolinks.

Development
------------
While developing in Reactjs, you will need to have the following running in a window on your host machine, in the rails root directory.
```
gulp watch
```

Notes
-------------
You will see that we are using reactjs to handle routing for the react app. We are doing this by having a catch-all route in the config/routes.rb file. For demostration purposes, you can see that the following routes are responded to/handled by reactjs "/react-car", "/react-bus"
