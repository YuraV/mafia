#$ ->
#  $container = $('#container')
#  toggleMenu = (tasksy)->
#    tasksy.each ->
#      $this = $(this)
#      flag = $this.hasClass('active')
#      $this[{true: 'removeClass', false: 'addClass'}[flag]]('active')
#
#      menu = $this.next('.taskymenu')
#
#      if flag
#        menu.fadeOut ->
#          menu.removeClass('up')
#      else
#        menu.css(display: 'block', opacity: 0) # hide element but set it display block to determin its offset and height
##        bottom = menu.offset().top + menu.outerHeight() # bottom of the tasky menu
##        bottom2 = $container.offset().top + $container.height() # bottom of the container
##
##        menu.addClass('up') if bottom > bottom2
##        menu.css(display: 'none', opacity: 1).show()
#
#  hideMenus = (n)->
#    $('.taskymenu:visible').not(n).prev('.tasksy').removeClass('active').next('.taskymenu').hide().removeClass('up')
#
#  $body = $(document.body)
#
#  $body.on 'mouseover', '.taskymenu', ->
#    $(this).stop().css('opacity', 1)
#  .on 'click.onapp', (e)->
#      do hideMenus
#  .on 'click', '.tasksy', (e)->
#      $this = $(this)
#      hideMenus $this.next('.taskymenu')
#      toggleMenu $this
#
#      do e.stopImmediatePropagation
#      false