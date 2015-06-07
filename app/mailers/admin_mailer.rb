class AdminMailer < ActionMailer::Base
	default from: "no-reply@vetpixl.com"
	default to: "stevendelarwelle@gmail.com"
	
	def new_user(user)
		@user = user
		mail(subject:"New User: #[user.email]")
	end	
end
