task :welcome => :environment do
  # puts "Sup"

  UserMailer.welcome_mail.deliver_now
  puts "Done"
end