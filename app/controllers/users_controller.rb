class UsersController < ApplicationController
  add_flash_types :success, :warning, :danger, :info

  def new
  end
  def index
  	@user = User.new
  end
  def create
  	@user = User.new(params[:user])

  	respond_to do |format|

	  	if @user.save
		    format.html 
		    format.js { flash[:notice] = "User created successfully" }
		    render :js => "window.location = '/'"
	  	else
	  	 	format.html { redirect_to '/', :error => "Could not create user" }      
	  	 	format.js { flash[:notice] = "User Not created successfully " }
	    end
    end
  end

  def show

  end
end
