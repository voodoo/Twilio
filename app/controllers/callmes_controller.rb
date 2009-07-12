class CallmesController < ApplicationController
  before_filter :admin_required, :only => [:list, :show]

  def index
    @callme = Callme.new
  end
  
  def create
    @callme = Callme.new(params[:callme])
    if @callme.save
      Mailer.deliver_ping('Call me', params.inspect)
      make_call
      flash[:notice]  = "Calling #{@callme.phone.to_phone} now ... please verify ..."
      redirect_to :action => 'thanks'
    else
      render :action => 'index'
    end
  end
  
  def list
    @callmes = Callme.paginate(:all, :page =>  params[:page])
  end
  
  def show
    @callme = Callme.find(params[:id])
  end
  
  def confirm
    @digit = params[:Digits]
    if @digit
      callme = Callme.find(params[:id])
      callme.update_attributes(:confirmed => true)
    end
    render :action => 'confirm.xml.builder', :layout => false
    rescue
       render :action => 'board/error.xml.builder', :layout => false
  end
  
  def callme
    @callme = Callme.find(params[:id])
    @pets   = Pet.find(params[:pets].split(','))
    render :action => 'callme.xml.builder', :layout => false    
    rescue
      render :action => 'board/error.xml.builder', :layout => false    
  end
  
  def pet_found
    @callme = Callme.find(params[:id])
    @pets   = params[:pets].split(',')
    @pet_id    = @pets[params[:Digits].to_i + 1]
    render :action => 'pet_found.xml.builder', :layout => false  
    rescue
       render :action => 'board/error.xml.builder', :layout => false  
  end
    
  def pet_found_confirmed
    @url    = params[:RecordingUrl]
    #@callme = Callme.find(params[:id])
    @pets   = params[:pets].split(',')
    @pet_id    = @pets[params[:Digits].to_i + 1]
    Mailer.deliver_pet_found(@pet, @url)
    
    render :action => 'pet_found_confirmed.xml.builder', :layout => false    
    rescue
       render :action => 'board/error.xml.builder', :layout => false
  end  
  
  protected
  def make_call
    twilio_connect
    #if Rails.env == 'production'
      puts Twilio::Call.make(TWILIO.phone, @callme.phone, "#{TWILIO.app_url}/callmes/#{@callme.id}/confirm").inspect
    #else
    #  Twilio::Call.make(TWILIO.phone, @callme.phone, "#{TWILIO.app_url}#{confirm_callme_path(@callme)}").inspect
    #end
  end
end
