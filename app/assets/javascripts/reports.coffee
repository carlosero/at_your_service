$(document).ready ->
  watch_form_action()
$(document).on 'page:change', ->
  watch_form_action()


@watch_form_action = ->
  $('.report-form').find('select#report').on 'change', ->
    $('.report-form').attr('action', $(this).val())
