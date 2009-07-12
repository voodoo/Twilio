class Mailer < ActionMailer::Base
  def notification pet, url, params = nil
     recipients   pet.user.email
     from         TWILIO.email
     bcc          'paul.vudmaska@gmail.com'
     subject      "Contact from Lost and Found"
     sent_on      Time.now
     content_type = "text/plain"
     body[:user]  = pet.user
     body[:pet]   = pet
     body[:url]   = url
   end

   def message message
      recipients   message.user.email
      from         TWILIO.email
      bcc          'paul.vudmaska@gmail.com'
      subject      "Contact from Lost and Found"
      sent_on      Time.now
      content_type = "text/plain"
      body[:message]  = message
    end
         
   def phone_message user, url, params = nil
      recipients   user.email
      from         TWILIO.email
      bcc          'paul.vudmaska@gmail.com'
      subject      "Contact from Lost and Found"
      sent_on      Time.now
      content_type = "text/plain"
      body[:user]  = user
      body[:url]   = url
      body[:params]= params
    end
    
    def ping subject, message
       recipients   TWILIO.email_user
       from         TWILIO.email_user
       subject      subject
       sent_on      Time.now
       content_type = "text/plain"
       body[:message]  = message
     end    
end
