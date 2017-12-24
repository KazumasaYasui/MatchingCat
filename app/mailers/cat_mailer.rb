class CatMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cat_mailer.send_when_complete.subject
  #
  default from: "test.mail.sample321@gmail.com"
  def send_when_complete(user)
    @user = user
    mail to:      user.email,
         subject: '保護ねこ応募完了のお知らせ'
  end
end
