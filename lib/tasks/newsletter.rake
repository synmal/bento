task :send_newsletter => :environment do
  # puts "Sup"
  User.all.each do |user|
    UserMailer.newsletter(user).deliver_now
  end
  puts "Done"
end