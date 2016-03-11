# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $colors = [
    '#1d96d5'
    '#efea3a'
    '#21aca8'
  ]
  count = $colors.length
  i = 0
  while(i < $('.students-index-image').length)
    idx = parseInt(Math.random() * count)
    $('.students-index-image').eq(i).css 'background-color', $colors[idx]
    i++;