# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title title
    @title = title
  end
  def iphone?
    request.user_agent =~ /iphone/i
  end 
  def navigation_links
    [
      [image_tag('/images/icons/icon.png', :style => 'width:26px', :align => 'top'), root_path],
      ['Lost', lost_pets_path],
      ['Found',found_pets_path],
      ['Search', search_pets_path],
      ['Submit', new_pet_path]
      ]    
  end 
  def twilio_path
    "#{TWILIO.api_url}/#{TWILIO.api}"
  end
  def twilio_accounts_path
    "#{twilio_path}/Accounts/#{TWILIO.sid}"
  end
    # def twilio_call_path sid
    #   "#{twilio_accounts_path}/Calls/#{sid}.mp3"
    # end
  def twilio_recording_path sid
    "#{twilio_accounts_path}/Recordings/#{sid}.mp3"
  end
  
end
