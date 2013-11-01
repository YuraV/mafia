class window.Games

  constructor: ->
    @sortFunction()
    @paginationFunction()
    @searchPreventDefault()
    @searchFunction()
    @Actions()
    @deadPlayer()
    @refreshDeadPlayer()



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








  Actions: ->
    $(document).on 'click', 'a.dropdown-toggle', ->
      $(this).parent('div').toggleClass('open')
      return false

#  roleFormVisible: ->
#    $('.put_role').hasClass('hidden')
#
#  remarkFormVisible: ->
#    $('.put_remarks').hasClass('hidden')
#
#  roleShowFormVisible: ->
#    $('.show_hide_role_container').hasClass('hidden')

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
