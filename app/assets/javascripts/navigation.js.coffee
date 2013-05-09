jQuery ->
  if (!window.matchMedia || (window.matchMedia("(max-width: 767px)").matches))
    $('a').tooltip(placement: 'bottom')


window.setTimeout (->
  $(".alert").slideUp 500, ->
    $(this).remove()
), 4000
