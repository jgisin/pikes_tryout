class Player < ApplicationRecord
  has_many :contacts

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def send_mail
    Player.send_confirmation_email(self.id)
  end

  class << self
    def send_confirmation_email(id)
      player = Player.find(id)
      ApplicationMailer.sign_up(player).deliver!
      ApplicationMailer.notify_admin(player).deliver!
    end
    handle_asynchronously :send_confirmation_email
  end
end
