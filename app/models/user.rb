class User < ApplicationRecord
  before_create :generate_nickname

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end

  def still_connected?
    still_there = OnlineChannel.broadcast_to(self)
    still_there.is_a?(Integer) && still_there.positive?
  end
end
