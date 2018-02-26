# Preview all emails at http://localhost:3000/rails/mailers/mass_mailer
class MassMailerPreview < ActionMailer::Preview

  def welcome
      friend_email = "jah@wel.com"
      subject = "Welcome"
      data = "Trust you are doing well!"
      sender = "loans@tuwe.tk"
   MassMailer.welcome(friend_email,toreply,data,subject,greeting,sender_name,sender,imagepath,linkpath,sent_at=Time.now)
  end
end
