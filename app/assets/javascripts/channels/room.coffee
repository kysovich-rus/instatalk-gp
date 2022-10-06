channel = undefined

jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')

  if messages.length > 0
    channel = createRoomChannel messages.data('room-id')
    ScrollBottom(250)
  else
    channel && channel.unsubscribe()
    return

  $(document).on 'keypress', '#message_body', (event) ->
    message = event.target.value

    if event.keyCode is 13
      App.room.speak(message)
      event.target.value = ""
      event.preventDefault()

createRoomChannel = (roomId) ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", roomId: roomId },
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log('Connected to RoomChannel')

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log('Disconnected from RoomChannel')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Received message ' + data['message'])
      $('#messages').append data['message']
      ScrollBottom(0)

    speak: (message) ->
      if message != ""
        @perform 'speak', message: message

ScrollBottom = (speed) ->
  $("#messages").animate({scrollTop: $("#messages").get(0).scrollHeight}, speed);
