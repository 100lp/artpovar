$ ->
  $(window).load ->
    i = 0
    images = [
      "background_02.jpg"
      "background_03.jpg"
      "background_01.jpg"
    ]
    image = $("b")
    
    #Initial Background image setup
    image.css "background-image", "url(assets/background_01.jpg)"
    
    #Change image at regular intervals
    setInterval (->
      image.fadeOut 2000, ->
        image.css "background-image", "url(assets/" + images[i++] + ")"
        image.fadeIn 2000
        return

      i = 0  if i is images.length
      return
    ), 5000
    return

  if $('body').hasClass('index')
    $('body').prepend("<b></b>")
    $('b').addClass('default')
    return


  (($, F) ->
    F.transitions.resizeIn = ->
      previous = F.previous
      current = F.current
      startPos = previous.wrap.stop(true).position()
      endPos = $.extend(
        opacity: 1
      , current.pos)
      startPos.width = previous.wrap.width()
      startPos.height = previous.wrap.height()
      previous.wrap.stop(true).trigger("onReset").remove()
      delete endPos.position

      current.inner.hide()
      current.wrap.css(startPos).animate endPos,
        duration: current.nextSpeed
        easing: current.nextEasing
        step: F.transitions.step
        complete: ->
          F._afterZoomIn()
          current.inner.fadeIn(750)
          return

      return

    return
  ) jQuery, jQuery.fancybox

  $(".fancybox").attr("rel", "gallery").fancybox
    padding: 0
    nextMethod: "resizeIn"
    nextSpeed: 50
    prevMethod: false
    afterLoad: ->
      @title = '<h4>' + @title + '</h4>' + $(@element).data("caption")
      return
    helpers:
      alt:
        type: "inside"
      title:
        type: "inside"

