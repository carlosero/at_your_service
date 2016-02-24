@mode = 'normal'

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
          if order_is_valid()
            waiter_id = $('#add_order_fields').find('#order_waiter').val()
            customer_id = $('#add_order_fields').find('#order_customer').val()
            customer_name = $('#add_order_fields').find('#order_customer_name').val()
            $.ajax
              url: "/orders"
              type: 'POST'
              dataType: 'JSON'
              data:
                order:
                  table_id: id
                  waiter_id: waiter_id
                  customer_id: customer_id
                customer_name: customer_name
                mode: mode
              error: (jqXHR, textStatus, errorThrown) ->
                console.log 'AJAX Error: ' + textStatus
              success: (data, textStatus, jqXHR) ->
                location.reload()
            $(this).dialog 'close'
      }
      {
        text: 'Cancel'
        click: ->
          reset_form()
          $(this).dialog 'close'
      }
    ]

@order_is_valid = ->
  fields_with_errors = false
  errors = []
  if $('#add_order_fields').find('#order_waiter').val() == ""
    fields_with_errors = true
    errors.push "You must select a waiter"
  if @mode == 'normal' && $('#add_order_fields').find('#order_customer').val() == ""
    fields_with_errors = true
    errors.push "You must select a customer"
  if @mode == 'add_customer' && $('#add_order_fields').find('#order_customer_name').val() == ""
    fields_with_errors = true
    errors.push "You must enter a customer"
  alert("There are some errors on the form:\n#{errors.join('\n')}") if fields_with_errors
  !fields_with_errors

@set_add_customer_mode = ->
  @mode = 'add_customer'
  customer_id = $('#add_order_fields').find('#order_customer').hide()
  $('#add_order_fields').find('div.new_customer_form').show()


@reset_form = ->
  @mode = 'normal'
  customer_id = $('#add_order_fields').find('#order_customer').show()
  $('#add_order_fields').find('div.new_customer_form').hide()