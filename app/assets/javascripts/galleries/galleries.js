//= require tn3/jquery.tn3.min.js

$(document).ready(function() {
	
  var tn1 = $('.gallery').tn3({
    skinDir : "/assets/tn3",
    skin : "tn3e",
    mouseWheel : false,
    startWithAlbums : true,
    autoplay : true,
    imageClick : "fullscreen",
    width : 980,
    height : 820,
    //startWithAlbums:true,
    image : {
     //maxZoom : 1.5,
      //crop : true,
      clickEvent : "dblclick",
      transitions:[{
          type:"grid",
          duration:300,
          easing:'easeInQuad'
      }, {
          type: "blinds",
          duration: 430,
          parts: 16,
          partDuration: 500,
          partEasing: "easeInOutQuad",
          method: "slide",
          partDirection: "top"
      }, {
          type: "blinds",
          duration: 410,
          easing: "easeInQuad",
          direction: "horizontal",
          parts: 5,
          partDuration: 390,
          partEasing: "easeOutQuad",
          method: "scale",
          partDirection: "bottom"
      }, {
          type: "blinds",
          duration: 313,
          easing: "easeInQuad",
          direction: "vertical",
          parts: 16,
          partDuration: 1100,
          partEasing: "easeInOutQuart",
          method: "fade",
          partDirection: "auto"
      }, {
          type: "grid",
          duration: 300,
          easing: "easeOutQuad",
          gridX: 9,
          gridY: 7,
          sort: "circle",
          sortReverse: false,
          diagonalStart: "bl",
          method: "fade",
          partDuration: 600,
          partEasing: "easeOutSine",
          partDirection: "left"
      }, {
          type: "grid",
          duration: 440,
          easing: "easeInQuad",
          gridX: 10,
          gridY: 5,
          sort: "random",
          sortReverse: false,
          diagonalStart: "bl",
          method: "scale",
          partDuration: 170,
          partEasing: "easeOutExpo",
          partDirection: "top"
      }]
    },
    thumbnailer : {
      shaderColor : "#aaaaaa",
      shaderOpacity : 0.8,
      shaderDuration : 800
    }
  });
});
