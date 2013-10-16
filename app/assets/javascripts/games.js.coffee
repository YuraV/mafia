$ ->
  $(document).delegate '#sortable_table th a', 'click', ->
    $.ajax($(this).prop('href'),
      dataType: 'html',
      type: 'GET'
    ).success((data) ->
      $('#sortable_table').html data
    )
    false

  $(document).on 'click', '#pagination a',->
    $.ajax($(this).prop('href'),
      dataType: 'html',
      type: 'GET'
    ).success((data) ->
      $('#sortable_table').html data
    )
    false

  $('#search').on 'submit', ->
    false

  $('#search input').keyup ->
    formAction = $('#search').attr('action')
    console.log(formAction)
    searchData = $(this).val()
    console.log searchData
    $.ajax(
      dataType: 'HTML',
      type: 'GET',
      url: formAction + '?utf8=✓&search='+ searchData,
    ).success((data) ->
      $('#sortable_table').html data
    )
    false

  $(document).on 'click', 'a.remark_link', (e)->
    $('.top_145_left_160').toggleClass('hidden')
    e.preventDefault
    false

  $('form.edit_game').on 'submit', ->
    game_id = $('.game').data('id')
    $.ajax(
      dataType:   'HTML',
      type:       'PUT',
      url:        '/games/' + game_id + '/appointments/put_remarks',
      data: $(this).serialize()

    ).success((data) ->
      $('.div2').replaceWith(data)

    )
    false