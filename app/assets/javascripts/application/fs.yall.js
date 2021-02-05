(function() {

  'use strict';

  document.addEventListener('turbolinks:load', function(event) {
    yall({ observeChanges: true });
  });

})();