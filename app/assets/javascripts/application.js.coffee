jQuery ->
  $('a').tooltip(placement: 'bottom')
window.setTimeout (->
  $(".alert").slideUp 500, ->
    $(this).remove()
), 4000
