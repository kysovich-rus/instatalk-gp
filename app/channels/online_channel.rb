class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
    stream_for current_user
  end

  def unsubscribed
  end
end
