class UserMailer < ActionMailer::Base
   default :from => ENV['EMAIL']
   
   def registration_confirmation(user)
     @user = user
     mail(:to => "#{user.name} <#{user.email}>", :subject => "You've been added to on GrantTracker")
   end
   
end
