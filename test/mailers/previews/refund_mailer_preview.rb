# Preview all emails at http://localhost:3000/rails/mailers/loan_mailer
class LoanMailerPreview < ActionMailer::Preview

  def refund
      friend_email = "jah@wel.com"
      subject = "Welcome"
      data = "<html><body><p>Trust you are doing well!</p><hr/></body></html>"
      #data = ""
      sender = "loans@tuwe.tk"
      toreply="loans@tuwe.tk"
      greeting="Howfar"
      sender_name="Jammy Hill"
   LoanMailer.refund(friend_email,toreply,data,subject,greeting,sender_name,sender,sent_at=Time.now)
  end
end
