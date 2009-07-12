class IphoneController < ApplicationController
  def dogs
    @pets = Pet.dogs
  end
  def cats
    @pets = Pet.cats
  end
  def lost
    @pets = Pet.lost
  end  
  def found
    @pets = Pet.found
  end  
  def pet
    @pet = Pet.find(params[:id])
  end
  def search
    if request.post?
      @pets = Pet.search params[:search], params[:page]
    end
  end  
  
end
