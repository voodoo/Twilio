class BoardController < ApplicationController
  layout nil
  def index
    @digit = params[:Digits]
    if @digit.blank?
      render :action => 'index.xml.builder'
    elsif @digit == '1'
      render :action => 'zip.xml.builder'
    elsif @digit == '2'
      @pets = Pet.find(:all, :limit => 5, :order => 'updated_at desc')
      render :action => 'recent.xml.builder'
    else
      render :action => 'message.xml.builder'
    end
  end

  def message
    @recordingUrl          = params[:RecordingUrl]  
    
    if @recordingUrl
      Mailer.deliver_phone_message(User.first, @recordingUrl, params)   
    end 
    render :action => 'message.xml.builder'
  end
  
  def search
    @zip        = params[:Digits]
    @zip_spaced = @zip.spaced
    @pets       = Pet.find(:all, :conditions => ['users.zip = ?', @zip], :include => :user)
    render :action => 'search.xml.builder'
  end
  
  def notify
    @digit   = params[:Digits].to_i
    @pet_ids = params[:pets].split(',')
    @pet_id  = @pet_ids[@digit - 1]
    @pet     = Pet.find(@pet_id)
    render :action => 'notify.xml.builder'    
  end
  
  def notify_confirmation
    @recordingUrl          = params[:RecordingUrl]
    @pet          = Pet.find(params[:pet])
    Mailer.deliver_notification(@pet, @recordingUrl, params)
    render :action => 'notify_confirmation.xml.builder'   
  end

  def test
    render :layout => 'application'
  end
  
end
