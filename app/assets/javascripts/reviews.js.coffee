jQuery ->
  $("#review-form")
    .on "ajax:beforeSend", (evt, xhr, settings) ->
      $(this).find('textarea')
        .addClass('uneditable-input')
        .attr('disabled', 'disabled')
    .on "ajax:success", (evt, data, status, xhr) ->
      $(this).find('textarea')
        .removeClass('uneditable-input')
        .removeAttr('disabled', 'disabled')
        .val('')
      $(xhr.responseText).insertAfter(this).show('slow')

  $(document)
    .on "ajax:beforeSend", ".review", ->
      $(this).fadeTo('fast', 0.5)
    .on "ajax:success", ".review", ->
      $(this).hide('fast')
    .on "ajax:error", ".review", ->
      $(this).fadeTo('fast', 1)
