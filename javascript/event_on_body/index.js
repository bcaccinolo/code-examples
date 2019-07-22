body = window.document.getElementsByTagName('body')[0];
body.addEventListener('mouseenter', function(ev) {
  ev.preventDefault;
  if(ev.target.tagName !== 'TD') {
    return;
  }
  ev.target.className = "bouya";
}, true);