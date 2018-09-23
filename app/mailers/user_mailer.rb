class UserMailer < ApplicationMailer

  default from: "kkolpa04@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'kkolpa04@gmail.com',
           subject: "A new contact form message from #{name}")
    end

end
