class Mailer < ActionMailer::Base
  def notification pet, url
     recipients   pet.user.email
     from         TWILIO.email
     bcc          'paul.vudmaska@gmail.com'
     subject      "Contact from Lost and Found"
     sent_on      Time.now
     content_type = "text/plain"
     body[:pet]   = pet
     body[:url]   = url
   end  

end
