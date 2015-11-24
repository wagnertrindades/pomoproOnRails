# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $("#real-button-pomo").click ->
    $("#pomodoros-list .collapsible-header").click()
  $("#real-button-break").click ->
    $("#short-breaks-list .collapsible-header").click()
  $("#real-button-long-break").click ->
    $("#long-breaks-list .collapsible-header").click()