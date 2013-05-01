#// require fancybox/helpers/jquery.fancybox-buttons.js
#// require fancybox/helpers/jquery.fancybox-thumbs.js
#//= require fancybox/jquery.fancybox.pack.js
#//= require jquerytools/jquery.tools.min.js

$ ->
  console.log "in home.js"
  $("#browsable").scrollable().navigator()

  $(".fancybox").fancybox
    maxWidth: 800
    maxHeight: 600
    #fitToView: false
    #width: "70%"
    #height: "70%"
    #autoSize: false
    #closeClick: false
    #openEffect: "none"
    #closeEffect: "none"