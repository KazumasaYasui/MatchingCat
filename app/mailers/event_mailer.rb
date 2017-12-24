class EventMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.send_when_complete.subject
  #
  default from: "test.mail.sample321@gmail.com"
  def send_when_complete(user)
    @user = user
    mail to:      user.email,
         subject: 'イベント応募完了のお知らせ'
  end
end
