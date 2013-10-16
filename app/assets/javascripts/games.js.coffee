$ ->
  $(document).delegate '#sortable_table th a', 'click', ->
    $.ajax($(this).prop('href'),
      dataType: 'html',
      type: 'GET'
    ).success((data) ->
      $('#sortable_table').html data
    )
    false

  $(document).delegate '#pagination a', 'click', ->
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