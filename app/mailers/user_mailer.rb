class UserMailer < ApplicationMailer
  default :from => "donotreply@fareshare.com"

  def registration_confirmation(user)
      mail :to => user.email,
           :subject => "Thanks For Registering!",
           :from => "donotreply@fareshare.com"
  end
  
end


class YourMailer < ActionMailer::Base
  def email_name
    mail :subject => "Mandrill rides the Rails!",
         :to      => "recipient@example.com",
         :from    => "you@yourdomain.com"
  end
end