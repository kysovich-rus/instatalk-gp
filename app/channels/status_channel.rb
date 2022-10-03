class StatusChannel < ApplicationCable::Channel
  after_unsubscribe :turn_offline

  def self.channel_action(user, status)
    ActionCable.server.broadcast "status_channel", user_id: user.id, status: status, nickname: user.nickname
  end

  def unsubscribed
  end

  def subscribed
    stream_from "status_channel"

    unless current_user.online
      StatusChannel.channel_action(current_user, "online")
      current_user.update(online: true)
    end
  end

  def turn_offline
    HandleOfflineJob.set(wait: 5.seconds).perform_later(current_user)
  end
end
