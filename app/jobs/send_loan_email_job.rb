class SendLoanEmailJob < ApplicationJob
  queue_as :default

  def perform(friend,toreply,data,subject,greeting,sender_name,sender)
    friend=friend
    toreply=toreply
    data=data
    subject=subject
    greeting=greeting
    sender_name=sender_name
    sender=sender
    LoanMailer.welcome(friend,toreply,data,subject,greeting,sender_name,sender).deliver_later
  end
  
end
