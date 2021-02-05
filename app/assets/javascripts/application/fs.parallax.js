(function() {

  'use strict';

  document.addEventListener('turbolinks:load', function(event) {

    var yPos = 0;
    var ticking = false;
    var snapContent = document.getElementById('snapContent');
    var hero = document.getElementById('hero');

    function parallax(y) {
      hero.style.transform = 'translate3d(0, ' + (y/2) + 'px, 0)'
    }

    snapContent.addEventListener('scroll', function(e) {
      yPos = this.scrollTop;
      if (!ticking) {
        window.requestAnimationFrame(function() {
          parallax(yPos);
          ticking = false;
        });
        ticking = true;
      }
    });

  });

})();

