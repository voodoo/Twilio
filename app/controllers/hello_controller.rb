class HelloController < ApplicationController
  before_filter :twilio_connect
  def index
    respond_to do |format|  
        format.xml {  }  
    end
  end
end
