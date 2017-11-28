App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # appendMessage('connected')
    # Called when the subscription is ready for use on the server

  disconnected: ->
    appendMessage('disconnected')
    # Called when the subscription has been terminated by the server

  received: (data) ->
    appendMessage(data.message)

  post_message: (message) ->
    @perform 'post_message', message: message

document.addEventListener 'DOMContentLoaded', () ->
  form = document.getElementById('message_form')
  form.addEventListener 'submit', (event) ->
    event.preventDefault()
    input = document.getElementById('message_field').value
    App.room.post_message(input)
    document.getElementById('message_field').value = ''

appendMessage = (message) ->
  element = document.createElement 'div'
  element.className = 'message'
  element.innerHTML = "<p>#{message}</p>"
  document.getElementById('messages').appendChild(element)
