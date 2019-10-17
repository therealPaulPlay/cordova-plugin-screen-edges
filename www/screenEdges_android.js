var exec = require('cordova/exec');

// Mocked because this plugin is an iOS-only feature.
exports.setPreferredEdges = function(edges, success, error) {
    if (typeof success === 'function') {
        setTimeout(function() {
            success();
        }, 0);
    }
};