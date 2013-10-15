$ ->
  $('#sortable, .pagination').delegate 'th a, a', 'click', ->
    $.ajax($(this).prop('href'),
      dataType: 'html',
      type: 'GET'
    ).success((data) ->
      $('#sortable').html data
    )
    false