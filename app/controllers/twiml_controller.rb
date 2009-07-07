class TwimlController < ApplicationController
  before_filter :set_twiml
  def index
    if request.post?
      render :action => 'create'
    else
      render :action => 'show'
    end
    respond_to do |format| 
        format.xml{}  
    end    
  end
  # 
  # def show
  #   respond_to do |format| 
  #       format.xml{}  
  #   end    
  # end
  # def create
  #   respond_to do |format| 
  #       format.xml{}  
  #   end
  # end  
  protected
  def set_twiml
    @twiml = Twiml.find_by_name(params[:id])  
 
  end
end