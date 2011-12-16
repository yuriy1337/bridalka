#//= require galleriffic/jquery.galleriffic
#//= require galleriffic/jquery.history
#//= require galleriffic/jquery.opacityrollover
#//= require galleriffic/jush

$ ->
  pageload = (hash) ->
    if hash
      $.galleriffic.gotoImage hash
    else
      gallery.gotoIndex 0
  $("div.navigation").css
    width: "300px"
    float: "left"

  $("div.content").css "display", "block"
  onMouseOutOpacity = 0.67
  $("#thumbs ul.thumbs li").opacityrollover
    mouseOutOpacity: onMouseOutOpacity
    mouseOverOpacity: 1.0
    fadeSpeed: "fast"
    exemptionSelector: ".selected"

  gallery = $("#thumbs").galleriffic(
    delay: 2500
    numThumbs: 15
    preloadAhead: 10
    enableTopPager: true
    enableBottomPager: true
    maxPagesToShow: 7
    imageContainerSel: "#slideshow"
    controlsContainerSel: "#controls"
    captionContainerSel: "#caption"
    loadingContainerSel: "#loading"
    renderSSControls: true
    renderNavControls: true
    playLinkText: "Play Slideshow"
    pauseLinkText: "Pause Slideshow"
    prevLinkText: "&lsaquo; Previous Photo"
    nextLinkText: "Next Photo &rsaquo;"
    nextPageLinkText: "Next &rsaquo;"
    prevPageLinkText: "&lsaquo; Prev"
    enableHistory: true
    autoStart: false
    syncTransitions: true
    defaultTransitionDuration: 900
    onSlideChange: (prevIndex, nextIndex) ->
      @find("ul.thumbs").children().eq(prevIndex).fadeTo("fast", onMouseOutOpacity).end().eq(nextIndex).fadeTo "fast", 1.0

    onPageTransitionOut: (callback) ->
      @fadeTo "fast", 0.0, callback

    onPageTransitionIn: ->
      @fadeTo "fast", 1.0
  )
  $.historyInit pageload, "advanced.html"
  $("a[rel='history']").live "click", (e) ->
    return true  unless e.button is 0
    hash = @href
    hash = hash.replace(/^.*#/, "")
    $.historyLoad hash
    false