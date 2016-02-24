@close_order = (order_id) ->
  if confirm("Are you sure?")
    $.ajax
      url: "/orders/#{order_id}/close"
      type: 'GET'
      dataType: 'JSON'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log 'AJAX Error: ' + textStatus
      success: (data, textStatus, jqXHR) ->
        location.reload()