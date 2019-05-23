cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "com.napolitano.cordova.plugin.intent.IntentPlugin",
    "file": "plugins/com.napolitano.cordova.plugin.intent/www/android/IntentPlugin.js",
    "pluginId": "com.napolitano.cordova.plugin.intent",
    "clobbers": [
      "IntentPlugin"
    ]
  },
  {
    "id": "cordova-plugin-barcodescanner.BarcodeScanner",
    "file": "plugins/cordova-plugin-barcodescanner/www/barcodescanner.js",
    "pluginId": "cordova-plugin-barcodescanner",
    "clobbers": [
      "cordova.plugins.barcodeScanner"
    ]
  },
  {
    "id": "cordova-plugin-camera.Camera",
    "file": "plugins/cordova-plugin-camera/www/CameraConstants.js",
    "pluginId": "cordova-plugin-camera",
    "clobbers": [
      "Camera"
    ]
  },
  {
    "id": "cordova-plugin-camera.CameraPopoverOptions",
    "file": "plugins/cordova-plugin-camera/www/CameraPopoverOptions.js",
    "pluginId": "cordova-plugin-camera",
    "clobbers": [
      "CameraPopoverOptions"
    ]
  },
  {
    "id": "cordova-plugin-camera.camera",
    "file": "plugins/cordova-plugin-camera/www/Camera.js",
    "pluginId": "cordova-plugin-camera",
    "clobbers": [
      "navigator.camera"
    ]
  },
  {
    "id": "cordova-plugin-camera.CameraPopoverHandle",
    "file": "plugins/cordova-plugin-camera/www/CameraPopoverHandle.js",
    "pluginId": "cordova-plugin-camera",
    "clobbers": [
      "CameraPopoverHandle"
    ]
  },
  {
    "id": "cordova-plugin-fcm-with-dependecy-updated.FCMPlugin",
    "file": "plugins/cordova-plugin-fcm-with-dependecy-updated/www/FCMPlugin.js",
    "pluginId": "cordova-plugin-fcm-with-dependecy-updated",
    "clobbers": [
      "FCMPlugin"
    ]
  },
  {
    "id": "cordova-plugin-inappbrowser.inappbrowser",
    "file": "plugins/cordova-plugin-inappbrowser/www/inappbrowser.js",
    "pluginId": "cordova-plugin-inappbrowser",
    "clobbers": [
      "cordova.InAppBrowser.open",
      "window.open"
    ]
  },
  {
    "id": "cordova-plugin-restful.RESTful",
    "file": "plugins/cordova-plugin-restful/www/RESTful.js",
    "pluginId": "cordova-plugin-restful",
    "clobbers": [
      "cordova.plugins.RESTful"
    ]
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "com.napolitano.cordova.plugin.intent": "0.1.3",
  "cordova-plugin-barcodescanner": "0.7.4",
  "cordova-plugin-camera": "4.0.3",
  "cordova-plugin-fcm-with-dependecy-updated": "2.4.0",
  "cordova-plugin-inappbrowser": "3.0.0",
  "cordova-plugin-restful": "0.0.3",
  "cordova-plugin-whitelist": "1.3.3"
};
// BOTTOM OF METADATA
});