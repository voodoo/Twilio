class ResourcesController < ApplicationController
  layout 'iphone'
  before_filter :twilio_connect
  def calls
    @response = Twilio::Call.list
    @callss    = @response['TwilioResponse']['Calls']
    @calls     = @callss['Call']
  end
  def call
    @call = Twilio::Call.get(params[:id])['TwilioResponse']['Call']
  end
  def recordings
    @response       = Twilio::Recording.list
    @recordingss    = @response['TwilioResponse']['Recordings']
    @recordings     = @recordingss['Recording']    
  end
  
  def notifications
    @response        = Twilio::Notification.list['TwilioResponse']
    @notificationss  = @response['Notifications']
    @notifications   = @notificationss['Notification']    
  end
    
  def phones
    @response       = Twilio::OutgoingCallerId.list['TwilioResponse']
    @phoness        = @response['OutgoingCallerIds']
    @phones         = @phoness['OutgoingCallerId']    
  end
end
