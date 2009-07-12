# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  protected
  def twilio_connect    
    Twilio.connect(TWILIO.sid, TWILIO.token)
  end

end
