# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@delete_foods_order = (id) ->
  if confirm("Are you sure?")
    $.ajax
      url: "/foods_orders/#{id}"
      type: 'DELETE'
      dataType: 'JSON'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log 'AJAX Error: ' + textStatus
      success: (data, textStatus, jqXHR) ->
        location.reload()
