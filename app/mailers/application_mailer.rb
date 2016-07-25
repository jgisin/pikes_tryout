class ApplicationMailer < ActionMailer::Base
  default from: 'admin@vigilantetryout.com'
  layout 'mailer'

  def sign_up(player)
    @player = player
    mail(to: @player.contacts.first.email, subject: 'Thanks for trying out with the Vigilantes')
  end

  def notify_admin(player)
    @player = player
    mail(to: ENV['ADMIN_EMAIL'], subject: "#{@player.name} has registered to tryout.")
  end
end
