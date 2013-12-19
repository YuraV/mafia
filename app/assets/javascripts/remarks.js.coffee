class window.Remarks extends window.Games


  constructor: ->
    @sendDataRemarksForm()
    @toggleShowRemarksForm()


  sendDataRemarksForm: ->
    self = @
    $('.put_remarks form.edit_game').on 'submit', ->
      url = $(this).attr('action')
      $.ajax
        dataType: 'HTML'
        type: 'PUT'
        url: url
        data: $(this).serialize()
      .success (data) ->
          $('.div2').replaceWith(data)
          $('.put_remarks').addClass('hidden')
          self.deadPlayer()
      false

  toggleShowRemarksForm: ->
    $(document).on 'click', 'a.remark_link', =>
      $('.put_role').addClass('hidden')
      $('.show_hide_role_container').addClass('hidden')
      $('.top_145_left_160.put_remarks').toggleClass('hidden')
      false

  remarkFormVisible: ->
    $('.put_remarks').hasClass('hidden')
