class UserMailer < ApplicationMailer
  default from: "donotreply@fareshare.com"

  def registration_confirmation(user)
    # binding.pry
    @user = user
    mail(to: @user.email, subject: "Thanks For Registering!")
  end

  def invoice_create(group)
    @group = group
    @group.users.each do |user|
      mail(to: user.email, subject: "Thanks For Registering!")
    end
  end
  
end


