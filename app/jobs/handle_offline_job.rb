class HandleOfflineJob < ApplicationJob
  queue_as :critical

  def perform(user)
    puts "IIIIIIIT IIIIIIIIIIIIIIIS CAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALED"
    return if user.still_connected?
    user.update(online: false)
    StatusChannel.channel_action(user, "offline")
  end
end
