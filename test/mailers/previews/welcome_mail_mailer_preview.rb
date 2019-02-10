# Preview all emails at http://localhost:3000/rails/mailers/welcome_mail_mailer
class WelcomeMailMailerPreview < ActionMailer::Preview
  def welcome_mail
    user = OpenStruct.new(email: "demo@example.com", name: "John Doe")
    UserMailer.welcome_mail(user)
  end
end
