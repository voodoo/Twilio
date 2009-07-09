class VerbsController < ApplicationController
  
  def create
    verb = Verb.create(params[:verb])
    redirect_to twiml_path(verb.twiml)
    flash[:notice] = "Twiml Verb created"
  end
  
  def new
    @twiml = Twiml.find(params[:twiml_id])
    @verb = Verb.new(:twiml_id => @twiml.id)
  end
  
  def edit
    @verb = Verb.find(params[:id])
  end
  
  def update
    @verb = Verb.find(params[:id])
    @verb.update_attributes(params[:verb])
    redirect_to twiml_path(@verb.twiml)
    flash[:notice] = "Twiml Verb updated"    
  end
    
  def destroy
    verb = Verb.find(params[:id])
    twiml = verb.twiml
    verb.destroy
    redirect_to edit_twiml_path(twiml)
    flash[:notice] = "Verb deleted"
  end
  
  def move_higher
    verb = Verb.find(params[:id])
    verb.move_higher
    redirect_to twiml_path(verb.twiml)
    flash[:notice] = "Verb Moved Up"    
  end
  
  def move_lower
    verb = Verb.find(params[:id])
    verb.move_lower
    redirect_to twiml_path(verb.twiml)
    flash[:notice] = "Verb Moved Down"    
  end
    
end