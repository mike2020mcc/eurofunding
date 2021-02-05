(function() {

  'use strict';

  document.addEventListener('turbolinks:load', function(event) {
    var video = document.querySelector('#hero video');
    if (!video) return;
    var media = JSON.parse(video.dataset.media);
    for(var i = 0; i < media.length; i++) {
      const medium = media[i];
      const mq = window.matchMedia(medium.query);
      if (mq.matches) {
        video.poster = medium.poster;
        var source = document.createElement('source');
        source.src = medium.filename;
        source.type = 'video/mp4';
        video.appendChild(source);
        break;
      }
    }
  });

})();
