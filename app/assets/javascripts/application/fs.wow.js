(function() {

  'use strict';

  document.addEventListener('turbolinks:load', function(event) {
    var wow = new WOW({
      scrollContainer: '#snapContent',
      mobile: false
    });
    wow.init();
  });


})();