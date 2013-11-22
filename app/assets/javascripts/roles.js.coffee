class window.Roles

  constructor: ->
    @toggleShowRolesContainer()
    @sendDataRoleForm()
    @toggleShowRolesForm()

  toggleShowRolesContainer: ->
    $(document).on 'click', '.show_hide_role', ->
      $('.put_remarks').addClass('hidden')
      $('.put_role').addClass('hidden')
      $('.top_145_left_160.show_hide_role_container').toggleClass('hidden')

      false

  sendDataRoleForm: ->
    $('.put_role form').on 'submit', ->
      url = $(this).attr('action')
      $.ajax
        dataType: 'HTML',
        type: 'PUT',
        url: url,
        data: $(this).serialize()
      .success (data) ->
          $('.dropzone-container').html data
          $('.put_role').addClass('hidden')
      false

  toggleShowRolesForm: ->
    $(document).on 'click', 'a.rolify', =>
      $('.put_remarks').addClass('hidden')
      $('.show_hide_role_container').addClass('hidden')
      $('.top_145_left_160.put_role').toggleClass('hidden')
      false
