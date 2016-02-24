@current_food_type = "foods";

@add_food = (id) ->
  reset_food_form()
  $('#add_food_fields').dialog
    height: 378
    width: 400
    modal: true
    title: 'Add Food'
    buttons: [
      {
        text: 'Add'
        click: ->
          amount = $('#add_food_fields').find('#foods_order_amount').val()
          food_id = selected_food_id()
          create_foods_order(id, food_id, amount)
          $(this).dialog 'close'
      }
      {
        text: 'Add Other'
        click: ->
          amount = $('#add_food_fields').find('#foods_order_amount').val()
          food_id = selected_food_id()
          create_foods_order(id, food_id, amount)
      }
      {
        text: 'Close'
        click: ->
          $(this).dialog 'close'
          reset_food_form()
      }
    ]

@create_foods_order = (order_id, food_id, amount) ->
  $.ajax
    url: "/orders/#{order_id}/add_food"
    type: 'POST'
    dataType: 'JSON'
    data: 'food':
      order_id: order_id
      food_id: food_id
      amount: amount
    error: (jqXHR, textStatus, errorThrown) ->
      console.log 'AJAX Error: ' + textStatus
    success: (data, textStatus, jqXHR) ->
      $("span.order_#{order_id}_total").html("$" + data.new_total)
      reset_food_form()

@change_food_type = (type) ->
  @current_food_type = type;
  if type == 'foods'
    $('div.foods_order_foods').show()
    $('div.foods_order_drinks').hide()
    select_food_defaults()
  else
    $('div.foods_order_foods').hide()
    $('div.foods_order_drinks').show()
    select_food_defaults()

@select_food_defaults = ->
  $('#foods_order_food').val(0);
  $('#foods_order_drink').val(0);

@selected_food_id = ->
  if @current_food_type == 'foods'
    $('div.foods_order_foods').find('#foods_order_food').val()
  else
    $('div.foods_order_drinks').find('#foods_order_drink').val()

@reset_food_form = ->
  $('#add_food_fields').find('#foods_order_amount').val(1)
  select_food_defaults()
