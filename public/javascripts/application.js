Event.observe(window, 'load', function() {
  $('center_align_helper').setStyle({ height: Math.max(
      Math.max(document.body.scrollHeight, document.documentElement.scrollHeight), 
      Math.max(document.body.offsetHeight, document.documentElement.offsetHeight), 
      Math.max(document.body.clientHeight, document.documentElement.clientHeight)
    ) + 'px'
  });
});