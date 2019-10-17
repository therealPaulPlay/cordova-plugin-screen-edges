---
title: ScreenEdgesPlugin
description: Controls the behavior of system gestures on iOS near screen edges.
---

# cordova-plugin-screen-edges

This plugin is used on iOS to change the behavior of screen edges. Normally, if you pull down from the top or the bottom, it will open the notifications or controls area. However, if your app is a game and has buttons near the top or bottom, you don't want this to happen. This plugin allows you to update the `preferredScreenEdgesDeferringSystemGestures` property of the main cordova view controller in order to control this. After setting the edges you want to control, iOS will require a double swipe to open the system UI at those edges instead of just a single swipe.

## Installation
    cordova plugin add https://github.com/distinctdan/cordova-plugin-screen-edges.git

## Methods

### ScreenEdgesPlugin.setPreferredEdges(edges, successCallback, errorCallback)
`edges` is an array that can contain the values `all`, `top`, `bottom`, `left`, and `right`. Pass in the edges for which you want to prevent system gestures. To allow system gestures on all edges, pass an empty array. This method can be called anytime after `device.ready` has fired.
```
// Entering immersive mode, tell iOS to prefer our app over the system gestures for top and bottom.
ScreenEdgesPlugin.setPreferredEdges(['top', 'bottom'], function() {
    console.log('success!');
}, function(err) {
    console.log('ERROR: ', err);
});
```
To reset, just pass an empty array.
```
// Leaving immersive mode, allow system gestures again.
ScreenEdgesPlugin.setPreferredEdges([], function() {
    console.log('success!');
}, function(err) {
    console.log('ERROR: ', err);
});
```
