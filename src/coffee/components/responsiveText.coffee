###
 * Requires jquery.responsiveText.js
###
$ ->
  # responsive text
  $('.responsive').not('table').each (index, object) ->
    compression = 10
    min = 10
    max = 200
    compression = parseFloat $(this).attr('data-compression') || compression
    min = parseFloat $(this).attr('data-min') || min
    max = parseFloat $(this).attr('data-max') || max
    $(object).responsiveText
      compressor: compression,
      minSize: min,
      maxSize: max