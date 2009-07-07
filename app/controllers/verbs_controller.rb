class VerbsController < ApplicationController
  def create
    Verb.create(params[:verb])
    redirect_to twimls_path
    flash[:notice] = "Twiml Verb created"
  end
  
  def edit
    @verb = Verb.find(params[:id])
  end
  
  def update
    @verb = Verb.find(params[:id])
    @verb.update_attributes(params[:verb])
    redirect_to edit_twiml_path(@verb.twiml)
    flash[:notice] = "Twiml Verb updated"    
  end  
  def destroy
    verb = Verb.find(params[:id])
    twiml = verb.twiml
    verb.destroy
    redirect_to edit_twiml_path(twiml)
    flash[:notice] = "Verb deleted"
  end
end