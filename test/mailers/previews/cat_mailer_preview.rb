# Preview all emails at http://localhost:3000/rails/mailers/cat_mailer
class CatMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/cat_mailer/send_when_complete
  def send_when_complete
    CatMailer.send_when_complete
  end

end
