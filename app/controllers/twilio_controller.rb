
class TwilioController < ApplicationController
  def index

  end
  
  def board
    @digit = params[:Digits]
    respond_to do |format|  
        format.xml {  }  
    end    
  end
end
