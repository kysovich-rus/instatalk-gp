App.status = App.cable.subscriptions.create "StatusChannel",
  connected: ->
    console.log('StatusChannel connected')

  disconnected: ->
    console.log('StatusChannel disconnected')

  received: (data) ->
    console.log('StatusChannel data received:')

    if (data["status"] == "online")
      $('#users_online').append "<div id='#{data["user_id"]}' class='text-success'><i class='bi bi-person-fill'>#{user.nickname}</i></div>"

    if (data["status"] == "offline")
      $("##{data["user_id"]}").remove()
