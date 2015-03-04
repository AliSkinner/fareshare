class UserMailer < ApplicationMailer
  default :from => "donotreply@fareshare.com"

  def registration_confirmation(user)
      mail(:to => user.email, :subject => "Thanks For Registering!")
  end
  
end