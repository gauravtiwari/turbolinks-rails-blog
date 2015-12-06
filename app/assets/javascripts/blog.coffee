window.App ||= {}

App.flashMessage = (message, type, timeout) ->
  $.snackbar
    content: message
    style: type
    timeout: timeout
  return
