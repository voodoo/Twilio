class BoardController < ApplicationController
  layout nil
  def index
    @digit = params[:Digits]
    if @digit.nil?
      render :action => 'index.xml.builder'
    elsif [1,2].include?(@digit.to_i)
      # if lost, search for found otherwise look for lost
      render :action => 'zip.xml.builder'
    elsif @digit == '3'
      render :action => 'create.xml.builder'
    end
  end
  
  def search
    @zip        = params[:Digits]
    @zip_spaced = @zip.scan(/\d/).map{|d| d}.join(' ')
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
    @url          = params[:RecordingUrl]
    @pet          = Pet.find(params[:pet])
    Mailer.deliver_notification(@pet, @url)
    render :action => 'notify_confirmation.xml.builder'   
  end

  def test
    render :layout => 'application'
  end
  
end
