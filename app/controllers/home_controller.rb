class HomeController < ApplicationController
  def index
    @title = "Welcome"
    @pets = Pet.all(:order => 'created_at desc').paginate(:page => params[:page])
  end
end
