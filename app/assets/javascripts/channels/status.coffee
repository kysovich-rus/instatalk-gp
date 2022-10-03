App.status = App.cable.subscriptions.create "StatusChannel",
  connected: ->
    console.log('StatusChannel connected')

  disconnected: ->
    console.log('StatusChannel disconnected')

  received: (data) ->
    console.log(data["users"])
    users = data["users"].map (i) -> "<div><i class='bi bi-person-fill'></i>#{i}</div>"
    $('#users_online').html(users.join(''))
