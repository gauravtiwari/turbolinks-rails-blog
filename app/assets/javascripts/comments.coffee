document.addEventListener 'page:after-node-removed', (event) ->
  LocalTime.run()
  return

document.addEventListener 'page:before-partial-replace', (event) ->
  LocalTime.run()
  return

document.addEventListener 'turbograft:remote:always', (event) ->
  if event.data.xhr.status == 401 # thrownError is 'Unauthorized'
    response = JSON.parse event.data.xhr.responseText
    App.flashMessage(response.message, "error", 5000)
