$ ->
  $('#sortable, .pagination').delegate 'th a, a', 'click', ->
    $.ajax($(this).prop('href'),
      dataType: 'html',
      type: 'GET'
    ).success((data) ->
      $('#sortable').html data
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
      $('#sortable').html data
    )
    false