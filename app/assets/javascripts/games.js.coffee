class window.Games

  constructor: ->
    @sortFunction()
    @paginationFunction()
    @searchPreventDefault()
    @searchFunction()
    @toggleShowRemarksForm()
    @sendDataRemarksForm()
    @Actions()
    @toggleShowRolesForm()
    @sendDataRoleForm()
    @deadPlayer()
    @refreshDeadPlayer()
    @toggleShowRolesContainer()



  sortFunction: ->
    $(document).delegate '#sortable_table th a', 'click', ->
      $.ajax $(this).prop('href'),
        dataType: 'html',
        type: 'GET'
      .success (data) ->
          $('#sortable_table').html data
      false

  paginationFunction: ->
    $(document).on 'click', '#pagination a', ->
      $.ajax $(this).prop('href'),
        dataType: 'html',
        type: 'GET'
      .success (data) ->
          $('#sortable_table').html data
      false

  searchPreventDefault: ->
    $('#search').on 'submit', ->
      false

  searchFunction: ->
    $('#search input').keyup ->
      formAction = $('#search').attr('action')
      searchData = $(this).val()
      $.ajax
        dataType: 'HTML',
        type: 'GET',
        url: formAction + '?utf8=✓&search=' + searchData,
      .success (data) ->
        $('#sortable_table').html data
      false

  sendDataRemarksForm: ->
    self = @
    $('.put_remarks form.edit_game').on 'submit', ->
      url = $(this).attr('action')
      $.ajax
        dataType: 'HTML',
        type: 'PUT',
        url: url
        data: $(this).serialize()
      .success (data) ->
          $('.div2').replaceWith(data)
          $('.put_remarks').addClass('hidden')
          self.deadPlayer()
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

  toggleShowRolesContainer: ->
    $(document).on 'click', '.show_hide_role', ->
      $('.put_remarks').addClass('hidden')
      $('.put_role').addClass('hidden')
      $('.top_145_left_160.show_hide_role_container').toggleClass('hidden')

      false

  toggleShowRemarksForm: ->
    $(document).on 'click', 'a.remark_link', =>
      $('.put_role').addClass('hidden')
      $('.show_hide_role_container').addClass('hidden')
      $('.top_145_left_160.put_remarks').toggleClass('hidden')
      false


  Actions: ->
    $(document).on 'click', 'a.dropdown-toggle', ->
      $(this).parent('div').toggleClass('open')
      return false

  roleFormVisible: ->
    $('.put_role').hasClass('hidden')

  remarkFormVisible: ->
    $('.put_remarks').hasClass('hidden')

  roleShowFormVisible: ->
    $('.show_hide_role_container').hasClass('hidden')

  refreshDeadPlayer: ->
    $(document).on 'click', '.put_remarks form input[type="submit"]', ->
      $('.item2').each ->
        $(this).children('a').addClass('btn-danger') if $(this).data('remarks') == 4

  deadPlayer: ->
    $('.remark_separator .player').each ->
      if $(this).data('remarks') == 4

        player = $(this).text()
        player = player.replace(/\s+/g, '');
        select_dead = $('.dropzone .item2 a:contains('+player+')').addClass('btn-danger')
        select_dead.next().addClass('btn-danger')
      else if $(this).data('remarks') != 4
        player = $(this).text()
        player = player.replace(/\s+/g, '');
        select_dead = $('.dropzone .item2 a:contains('+player+')').removeClass('btn-danger')
        select_dead.next().removeClass('btn-danger')
