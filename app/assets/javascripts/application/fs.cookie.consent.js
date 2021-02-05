(function() {

  'use strict';

  var CONSENT_KEY = 'CookieConsent';

  document.addEventListener('turbolinks:load', function(event) {
    var consent = document.getElementById('cookieConsent');
    if (!consent) return;
    if (localStorage.getItem(CONSENT_KEY)) return;
    setTimeout(function() {
      consent.classList.add('pending');
      var consentButton = document.getElementById('cookieButton');
      consentButton.addEventListener('click', function(event) {
        localStorage.setItem(CONSENT_KEY, true);
        consent.classList.add('okayed');
      })
    }, 10000);

    
  });

})();