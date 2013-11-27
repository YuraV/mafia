class window.Drag_Drop

  constructor: ->
    @DragDrop()

  DragDrop: ->
    resetUIDropZone = ->
      $(".dropzone .selected").removeClass("selected").attr "draggable", false
      $(".dragover").removeClass "dragover"
    getFrame = ($items) ->
      offset = $items.first().offset()
      frame =
        lx: offset.left
        ly: offset.top
        rx: offset.left
        ry: offset.top

      $items.each ->
        $this = $(this)
        offset = $this.offset()
        width = $this.width()
        height = $this.height()
        frame.lx = offset.left  if offset.left < frame.lx
        frame.ly = offset.top  if offset.top < frame.ly
        frame.rx = offset.left + width  if offset.left + width > frame.rx
        frame.ry = offset.top + height  if offset.top + height > frame.ry

      frame

    resetUI = ->
      $(".selected").removeClass("selected").attr "draggable", false
      $(".dragover").removeClass "dragover"
    jQuery.event.props.push "dataTransfer"
    jQuery.event.props.push "pageX"
    jQuery.event.props.push "pageY"

    $(".item").on("click", (e) ->
      items1 = $('.selected').length
      items2 = $('.item2').length
      count = items1 + items2
      e.preventDefault()
      if count == 10
        $(this).removeClass "selected"
#        false
      else
        $(this).toggleClass "selected"
      @draggable = $(this).hasClass("selected")
    ).on("dragstart", (e) ->
      html = ""
      $selectedItems = $(".items .selected")
      $selectedItems.each ->
        html += @outerHTML

      e.dataTransfer.setData "text/html", html
      $draggedItem = $(e.currentTarget)
      draggedItemOffset = $draggedItem.offset()
      frame = getFrame($selectedItems)
      dx = e.pageX - draggedItemOffset.left + (draggedItemOffset.left - frame.lx)
      dy = e.pageY - draggedItemOffset.top + (draggedItemOffset.top - frame.ly)
      $image = $(document.createElement("div"))
      $image.css
        position: "absolute"
        zIndex: -1
        left: frame.lx
        top: frame.ly
        width: Math.abs(frame.lx - frame.rx)
        height: Math.abs(frame.ly - frame.ry)

      $selectedItems.each (i, item) ->
        $item = $(item)
        $clone = $item.clone()
        itemOffset = $item.offset()
        $clone.css
          position: "absolute"
          left: itemOffset.left - frame.lx
          top: itemOffset.top - frame.ly

        $image.append $clone

      $("body").append $image
      e.dataTransfer.setDragImage $image.get(0), dx, dy
      window.setTimeout (->
        $image.remove()
      ), 1
      true
    ).on "dragend", (e) ->
      resetUI()

    $(".dropzone").on("dragenter", (e) ->
      $(this).addClass "dragover"
    ).on("dragleave", (e) ->
      $(this).removeClass "dragover"
    ).on("dragover", (e) ->
      e.preventDefault()  if e.preventDefault
      false
    ).on "drop", (e) ->
      html = e.dataTransfer.getData("text/html")
      $(this).append html
      resetUIDropZone()
      $s = $(".selected").filter(->
        $ "div", this
      )
      userData = $s.map(->
        {
          user_id: $(this).data('id')
        }
      ).get()
      game_id = $('.game').data('id')
      $s.remove()
      $.ajax '/games/'+game_id+'/players/create_bunch',
        type: 'post'
        data:
          player_data: userData,
        success: location.reload()


    loop_ = window.setInterval(->
      if $(".dropzone .item").size() >= 28
        $(".dropzone-container").addClass "completed"
        window.clearInterval loop_
    , 1000)
