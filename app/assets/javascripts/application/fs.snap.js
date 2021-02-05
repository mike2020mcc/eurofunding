(function() {

  'use strict';

  document.addEventListener('turbolinks:load', function(event) {
    
    var snapper = new Snap({
      element: document.getElementById('snapContent'),
      dragger: document.getElementById('navbar'),
      disable: 'left',
      maxPosition: 265,
      minPosition: -265
    });

    var toggler = document.getElementById('openRight')

    toggler.addEventListener('click', function() {

      if (snapper.state().state == 'right') {
        snapper.close();
      } else {
        var snapContent = document.getElementById('snapContent');
        snapContent.scrollTo(0, 0);
        snapper.open('right');
      }

    });

  });

})();