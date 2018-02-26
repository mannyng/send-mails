# Preview all emails at http://localhost:3000/rails/mailers/loan_mailer
class LoanMailerPreview < ActionMailer::Preview
  def welcome
      friend_email = "jah@wel.com"
      subject = "Welcome"
      data = "Trust you are doing well!"
      sender = "loans@tuwe.tk"
      toreply="loans@tuwe.tk"
      greeting="Howfar"
      sender_name="Jammy Hill"
   LoanMailer.welcome(friend_email,toreply,data,subject,greeting,sender_name,sender,sent_at=Time.now)
  end
end
