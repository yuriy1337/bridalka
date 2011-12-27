$ ->
  $("#nav ul li").hover(
    () ->
      $(this).switchClass "default", "hover", 500;
    () ->
      $(this).switchClass "hover", "default", 500;
  )
  
  $('.input').click(clearText).blur(setText)
  
  $('.ui-button').hover(
    () ->
      $(this).addClass "ui-state-hover"
    () ->
      $(this).removeClass "ui-state-hover" 
  )
    


clearText = ->
  if this.value is this.title
    this.value = ''
    
setText = -> 
  if this.value is ''
    this.value = this.title
