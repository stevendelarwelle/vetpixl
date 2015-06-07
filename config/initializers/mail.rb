ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "app36995623@heroku.com",
	password: "yktG5XFpFLeIan4Y79PF6w",
	authentication: "login"
	}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"