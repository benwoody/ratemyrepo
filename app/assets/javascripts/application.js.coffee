jQuery ->
  $('a').tooltip(placement: 'bottom')
  window.setTimeout (->
    $(".alert").fadeTo(500, 0).slideUp 500, ->
      $(this).remove()
  ), 4000
