class LoanMailer < ApplicationMailer
       default from: "customer_service@tuwerk.tk"
    
    def welcome(friend_email,toreply,data,subject,greeting,sender_name,sender,sent_at=Time.now)
        @friend_email = friend_email
        #@friend_email = friend_email.each_index{|b|}
        @subject = subject
        @body=data
        @sender=sender
        @sender_name = sender_name
        @sent_at = sent_at
        @greeting = greeting
        @reply_to=toreply
        @cover = "View"
        @cover1 = "Download Document"
        email_with_name = %("#{@sender_name}" <#{@sender}>)
        
        delivery_options = { user_name: "SMTP_KEY",
                           password: "SMPT_PASS",
                           address: "mail.tuwerk.tk" }
        mail(
            subject: @subject,
            to: @friend_email,
            from: email_with_name,
            reply_to: @reply_to,
            delivery_method_options: delivery_options
            ) 
    end 
    def refund(friend_email,toreply,data,subject,greeting,sender_name,sender,sent_at=Time.now)
        @friend_email = friend_email
        #@friend_email = friend_email.each_index{|b|}
        @subject = subject
        @body=data
        @sender=sender
        @sender_name = sender_name
        @sent_at = sent_at
        @greeting = greeting
        @reply_to=toreply
        @cover = "View"
        @cover1 = "Download Document"
        email_with_name = %("#{@sender_name}" <#{@sender}>)
        
        delivery_options = { user_name: "SMTP_KEY",
                           password: "SMPT_PASS",
                           address: "mail.tuwerk.tk" }
        mail(
            subject: @subject,
            to: @friend_email,
            from: email_with_name,
            reply_to: @reply_to,
            delivery_method_options: delivery_options
            ) 
    end
    
end
