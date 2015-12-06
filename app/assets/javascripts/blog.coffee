window.App ||= {}

App.init = () ->
  autosize $('textarea')

App.flashMessage = (message, type, timeout) ->
  $.snackbar
    content: message
    style: type
    timeout: timeout
  return

$(document).on 'ready', (event) ->
  App.init()
  return
