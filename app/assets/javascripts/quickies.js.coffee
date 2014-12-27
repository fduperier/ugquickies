# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.form_datetime').datetimepicker({
    language: 'fr',
    autoclose: true,
    todayBtn: true,
    fontAwesome: true,
    pickerPosition: "bottom-left"
    format: 'dd/mm/yyyy hh:ii'
  });