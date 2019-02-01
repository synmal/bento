task :send_newsletter => :environment do
  # puts "Sup"
  UserMailer.newsletter.deliver_now
  puts "Done"
end