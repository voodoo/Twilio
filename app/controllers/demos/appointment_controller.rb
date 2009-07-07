class AppointmentController < ApplicationController
  #before_filter :twilio_connect
  def index
    @number = params[:number]
    twilio_call if request.post? and !@number.blank?
  end
  
  def reminder
    respond_to do |format|  
        format.xml {  }  
    end    
  end
  protected
  def twilio_call
    #twilio_connect
    posting = {  
        'Caller' => TWILIO.phone,  
        'Called' => @number,  
        'Url'    => TWILIO.base + '/appointment/reminder'  
    }
    uri = URI.parse("#{TWILIO.url}/#{TWILIO.sid}/Calls")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true        
    req = Net::HTTP::Post.new(uri.request_uri)
    req.set_form_data(posting)
    req.basic_auth(TWILIO.sid, TWILIO.token)
    puts http.request(req)
    
  end
end
