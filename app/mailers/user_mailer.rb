class UserMailer < ApplicationMailer

  default from: "kkolpa04@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'kkolpa04@gmail.com',
           subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Retro Bike Berlin"
    mail(to: user.email,
    subject: "Welcome to #{@appname}!")
  end

  def order_confirmation_email(user, product)
  		@product = product
  		@user = user
  		mail( from: "donotreply@retro-bikes.herokuapp.com",
  			  to: @user.email,
  			  subject: "Confirmation of your purchase at Retro Bikes")
  	end


end
