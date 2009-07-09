class TwimlController < ApplicationController
  #before_filter :set_twiml
  def index
    
    if params[:id]
      @twiml  = Twiml.find_by_name(params[:id]) 
    else
      @twiml  = Twiml.first
    end
    
    if request.post?      
      render :action => 'board'
    else
      # Respond to Gather
      @digit = params[:Digits].to_i
      @action = @twiml.verbs[@digit-1] if @twiml # Prob should just throw error
      render :action => 'respond'
    end
    
    respond_to do |format| 
        format.xml{}  
    end    
  
  end
  
  def test_harness
    @twimls = Twiml.all
  end

end