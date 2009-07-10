class TwimlsController < ApplicationController
  before_filter :login_required
  before_filter :admin_required
  layout 'iphone'
  
  def index
    @twimls = Twiml.all
  end
  
  def new
    @twiml = Twiml.new
  end
  
  def create
    twiml = Twiml.create(params[:twiml])
    flash[:notice] = "Twiml created"
    redirect_to twiml_path(twiml)
  end

  def edit
    @twiml = Twiml.find_by_name(params[:id])
    @verb  = Verb.new
  end  
  
  def update
    @twiml = Twiml.find_by_name(params[:id])
    @twiml.update_attributes(params[:twiml])
    redirect_to twimls_path
    flash[:notice] = "Update complete"
  end
  
  def show
    @twiml = Twiml.find_by_name(params[:id])

  end
  
  def destroy
    @twiml = Twiml.find_by_name(params[:id])
    @twiml.destroy
    redirect_to twimls_path
    flash[:notice] = "Twiml deleted"    
  end
end
