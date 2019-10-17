var exec = require('cordova/exec');

exports.setPreferredEdges = function(edges, success, error) {
    if (!edges) edges = [];
    exec(success, error, 'ScreenEdgesPlugin', 'setPreferredEdges', [edges]);
};