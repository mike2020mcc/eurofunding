(function() {

  'use strict';

  document.addEventListener('turbolinks:load', function(event) {

    var yPos = 0;
    var ticking = false;
    var navbar = document.getElementById('navbar');

    function invertNavbar(y) {
      if (y > 50) {
        navbar.classList.remove('navbar-dark');
        navbar.classList.add('navbar-light', 'bg-white');
      } else {
        navbar.classList.remove('navbar-light', 'bg-white');
        navbar.classList.add('navbar-dark');
      }
    }

    console.log(navbar.dataset.solid !== undefined)

    if (navbar.dataset.solid !== undefined) {
      navbar.classList.remove('navbar-dark');
      navbar.classList.add('navbar-light', 'bg-white');
      return;
    }
    
    
    var snapContent = document.getElementById('snapContent');
    snapContent.addEventListener('scroll', function(e) {
      yPos = this.scrollTop;
      if (!ticking) {
        window.requestAnimationFrame(function() {
          invertNavbar(yPos);
          ticking = false;
        });
        ticking = true;
      }
    });
    
  });

})();
