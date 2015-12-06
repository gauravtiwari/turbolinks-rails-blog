document.addEventListener 'page:after-node-removed', (event) ->
  LocalTime.run()
  return

document.addEventListener 'page:before-partial-replace', (event) ->
  LocalTime.run()
  return

document.addEventListener 'turbograft:remote:always', (event) ->
  $('form')[0].reset()
  response = JSON.parse event.data.xhr.responseText
  App.flashMessage(response.message, "error", 5000)
  if response.url
	  setTimeout (->
	    Turbolinks.visit response.url
	    return
	  ), 2000
