(function() {

  var stylesLoader = function() {
    var addStylesNode = document.getElementById('js:defer');
    if (addStylesNode.tagName == 'DIV') return;
    var replacement = document.createElement('div');
    replacement.id = 'js:defer';
    replacement.innerHTML = addStylesNode.textContent;
    document.body.appendChild(replacement)
    addStylesNode.parentElement.removeChild(addStylesNode);
  };

  var raf = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
  
  if (raf) {
    raf(function() { window.setTimeout(stylesLoader, 0); });
  } else {
    window.addEventListener('load', stylesLoader);
  }

})();