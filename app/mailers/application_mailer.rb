class ApplicationMailer < ActionMailer::Base
  default from: 'admin@vigilantetryout.com'
  layout 'mailer'

  def sign_up(player)
    @player = player
    mail(to: @player.contacts.first.email, subject: 'Thanks for trying out with the Vigilantes')
  end
end
