(function() {

  'use strict';

  var OneSignal = window.OneSignal || [];
  OneSignal.push(function() {
    OneSignal.init({
      appId: "4c9162e0-e79d-4311-a00d-229e21582afa",
      safari_web_id: "web.onesignal.auto.66a57acb-1f7c-44c2-af57-20e68d9690d6", 
      welcomeNotification: {
        "title": "Financial Solutions",
        "message": "Thank you for subscribing!"
      }
    });
    var notificationPromptDelay = 20000;
    var navigationStart = window.performance.timing.navigationStart;
    var timeNow = Date.now();
    setTimeout(promptAndSubscribeUser, Math.max(notificationPromptDelay - (timeNow - navigationStart), 0));
  });
  function promptAndSubscribeUser() {
    window.OneSignal.isPushNotificationsEnabled(function(isEnabled) {
      if (!isEnabled) {
        window.OneSignal.showSlidedownPrompt();
      }
    });
  }
  OneSignal.push(function() {
    OneSignal.on('subscriptionChange', function(isSubscribed) {
      if (isSubscribed) {
        OneSignal.sendTags({
          url: window.location.pathname,
          topic: 'tags'
        }).then(function(tagsSent) {
          //console.log('tagsSent:' + JSON.stringify(tagsSent));
        });
      }
    });
  });
    
})();