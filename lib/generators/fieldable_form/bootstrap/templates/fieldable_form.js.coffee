# mostly from http://railscasts.com/episodes/403-dynamic-forms
$(document).on 'click', "a[data-<%= dname %>='remove_field']", (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  event.preventDefault()

$(document).on 'click', "a[data-<%= dname %>='add_field']", (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  target = $(this).data('target')
  $(target).append($(this).data('fields').replace(regexp, time))
  event.preventDefault()
