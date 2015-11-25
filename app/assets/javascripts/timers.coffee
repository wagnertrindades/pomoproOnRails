# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $("#real-button-pomo").click ->
    $("#pomodoros-list .collapsible-body").show()
    lengthPomo = parseInt(($("#pomos-length").text()), 10) + 1
    $("#pomos-length").text(lengthPomo)
  $("#real-button-break").click ->
    $("#short-breaks-list .collapsible-body").show()
    lengthBreak = parseInt(($("#breaks-length").text()), 10) + 1
    $("#breaks-length").text(lengthBreak)
  $("#real-button-long-break").click ->
    $("#long-breaks-list .collapsible-body").show()
    lengthLongBreak = parseInt(($("#long-breaks-length").text()), 10) + 1
    $("#long-breaks-length").text(lengthLongBreak)