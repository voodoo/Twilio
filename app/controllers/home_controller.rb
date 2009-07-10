class HomeController < ApplicationController
  def index
    @title = "Welcome"
    @pets = Pet.all.paginate(:page => params[:page])
  end
end
