class NewsletterMailerPreview < ActionMailer::Preview
	def welcome_mail
		user = OpenStruct.new(email:"demo@example.com", first_name:"John", last_name:"Doe")
		UserMailer.welcome_mail(user)
	end
end