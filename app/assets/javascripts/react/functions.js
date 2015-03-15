var reactFunctions = reactFunctions || {}

reactFunctions.setNamespace = function (namespace) {
    var nsparts = namespace.split(".");
    window[nsparts[0]] = window[nsparts[0]] || {};
    var parent = window[nsparts[0]];
 
    // loop through the parts and create a nested namespace if necessary
    for (var i = 1; i < nsparts.length; i++) {
        var partname = nsparts[i];
        // check if the current parent already has the namespace declared
        // if it isn't, then create it
        if (typeof parent[partname] === "undefined") {
            parent[partname] = {};
        }
        // get a reference to the deepest element in the hierarchy so far
        parent = parent[partname];
    }
    // the parent is now constructed with empty namespaces and can be used.
    // we return the outermost namespace
    return parent;
};
