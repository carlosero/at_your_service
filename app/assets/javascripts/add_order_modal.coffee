@add_order = (id) ->
  $('#add_order_fields').dialog
    height: 279
    width: 400
    modal: true
    title: 'Add Order'
    buttons: [
      {
        text: 'Create'
        click: ->
          waiter_id = $('#add_order_fields').find('#order_waiter').val()
          customer_id = $('#add_order_fields').find('#order_customer').val()
          $.ajax
            url: "/orders"
            type: 'POST'
            dataType: 'JSON'
            data: 'order':
              table_id: id
              waiter_id: waiter_id
              customer_id: customer_id
            error: (jqXHR, textStatus, errorThrown) ->
              console.log 'AJAX Error: ' + textStatus
            success: (data, textStatus, jqXHR) ->
              location.reload()
          $(this).dialog 'close'
      }
      {
        text: 'Cancel'
        click: ->
          $(this).dialog 'close'
      }
    ]
