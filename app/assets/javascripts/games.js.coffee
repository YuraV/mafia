class window.Games

  constructor: ->
    @sortFunction()
    @paginationFunction()
    @searchPreventDefault()
    @searchFunction()
    @toggleShowRemarksForm()
    @sendDataRemarksForm()
    @Actions()

  sortFunction: ->
    $(document).delegate '#sortable_table th a', 'click', ->
      $.ajax $(this).prop('href'),
        dataType: 'html',
        type: 'GET'
      .success (data) ->
        $('#sortable_table').html data
      false

  paginationFunction: ->
    $(document).on 'click', '#pagination a',->
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
        url: formAction + '?utf8=✓&search='+ searchData,
      .success(data) ->
        $('#sortable_table').html data

      false

  toggleShowRemarksForm: ->
    $(document).on 'click', 'a.remark_link', (e)->
      $('.top_145_left_160.put_remarks').toggleClass('hidden')
      e.preventDefault
      false

  sendDataRemarksForm: ->
    $('.put_remarks form.edit_game').on 'submit', ->
      url = $(this).attr('action')
      $.ajax
        dataType:   'HTML',
        type:       'PUT',
        url:        url
        data: $(this).serialize()

      .success (data) ->
        $('.div2').replaceWith(data)

      false

  Actions: ->
    $(document).on 'click', 'a.dropdown-toggle', ->
      $(this).parent('div').toggleClass('open')
      return false



#  $('#sortable_table i').on 'click', ->
#    $(this).parent('a').click()
