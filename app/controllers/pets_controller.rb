class PetsController < ApplicationController
  before_filter :login_required, :only => [:new, :create, :edit, :update]
  def index
    @title = "All Pets"
    @pets = Pet.all.paginate(:page => params[:page])
  end

  def lost
    @title = "Lost Pets"
    @pets = Pet.find_all_by_lost_or_found('Lost').paginate(:page => params[:page])
    render :action => :index
  end
  
  def found
    @title = "Found Pets"
    @pets = Pet.find_all_by_lost_or_found('Found').paginate(:page => params[:page])
    render :action => :index
  end
  
  def cats
    @title = "Pets - Cats"
    @pets = Pet.find_all_by_dog_or_cat('Cat').paginate(:page => params[:page])
    render :action => :index
  end
  
  def dogs
    @title = "Pets - Dogs"
    @pets = Pet.find_all_by_dog_or_cat('Dog').paginate(:page => params[:page])
    render :action => :index
  end
      
  def show
    @pet = Pet.find(params[:id])
  end
    
  def new
    @title = 'New Pet'
    @pet = Pet.new(:lost_or_found => 'Lost', :dog_or_cat => 'Dog')
  end
  
  def create
    @pet = current_user.pets.new(params[:pet])
    if @pet.save
      flash[:notice] = "Successfully created pet."
      redirect_to @pet
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pet = current_user.pets.find(params[:id])
  end
  
  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(params[:pet])
      flash[:notice] = "Successfully updated pet."
      redirect_to @pet
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    flash[:notice] = "Successfully destroyed pet."
    redirect_to pets_url
  end
  
  def search
    if request.post?
      @zip = params[:search][:zip]
      @pets = Pet.find(:all, 
      :conditions => Condition.block { |c| 
        c.and :sex, params[:search][:sex]
        c.and :dog_or_cat, params[:search][:dog_or_cat]
        c.and :lost_or_found, params[:search][:lost_or_found]
        c.and :zip, @zip unless @zip.blank?
      }).paginate(:page => params[:page])
    end
  end
end
