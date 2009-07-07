class RecorderController < ApplicationController
  def index
    if request.post?
      @number = params[:number]
      record
      puts @response
      puts @response =~ /<Sid>(.*)<\/Sid>/
      
      puts '*'*20
      redirect_to :action => 'list', :sid => $1, :hello => 'heelo'
    end
  end
  
  def make_call
    respond_to do |format|  
        format.xml {  }  
    end    
  end
  
  def play
    @recording = params[:RecordingUrl]
    respond_to do |format|  
        format.xml {  }  
    end    
  end
  
  def list    
    Twilio.connect(TWILIO.sid, TWILIO.token)
    s =  Twilio::Recording.list(:num => 2, :page => params[:page] || 0)
    puts s.inspect
    @recordings = s["TwilioResponse"]["Recordings"]#["Recording"]
  end
  
  # def call
  #   Twilio.connect(TWILIO.sid, TWILIO.token)    
  # end
  
  protected
  def record
    #twilio_connect
    posting = {  
        'Caller' => TWILIO.phone,  
        'Called' => @number,  
        'Url'    => TWILIO.base + '/recorder/make_call'  
    }
    uri = URI.parse("#{TWILIO.url}/#{TWILIO.sid}/Calls")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true        
    req = Net::HTTP::Post.new(uri.request_uri)
    req.set_form_data(posting)
    req.basic_auth(TWILIO.sid, TWILIO.token)
    @response = http.request(req).response    
  end
end
