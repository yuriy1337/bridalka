$ ->
  $("#nav ul li").hover(
    () ->
      $(this).switchClass "default", "hover", 500;
    () ->
      $(this).switchClass "hover", "default", 500;
  )
