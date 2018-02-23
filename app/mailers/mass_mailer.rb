class MassMailer < ApplicationMailer
    default from: "customer_service@tuwerk.tk"
    
    def welcome(friend_email,subject,data,sender,sent_at=Time.now)
        @friend_email = friend_email
        #@friend_email = friend_email.each_index{|b|}
        @subject = subject
        @body=data
        @sender=sender
        @sent_at = sent_at
        @greeting = "Welcome"
        
        delivery_options = { user_name: "SMTP_KEY",
                           password: "SMPT_PASS",
                           address: "mail.tuwerk.tk" }
        mail(
            subject: @subject,
            to: @friend_email,
            from: @sender,
            delivery_method_options: delivery_options
            ) 
    end 
    
end
