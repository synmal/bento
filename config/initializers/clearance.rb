Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "bento@bentonext.com"
  config.rotate_csrf_on_sign_in = true
<<<<<<< HEAD
  # Clearance::PasswordsController.layout "my_passwords_layout"
=======
  # Clearance::PasswordsController.layout 'my_passwords_layout'
>>>>>>> upstream/master
end
