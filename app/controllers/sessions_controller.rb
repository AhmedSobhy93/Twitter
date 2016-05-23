class SessionsController < ApplicationController
	include SessionsHelper 
	
	def new
	end
	
	def index
  		@session = Session.new
 	end


	def create
		user = User.find_by_email(params[:session][:email])

		respond_to do |format|

			if(user && user.authenticate(params[:session][:password]))
			    format.html 
			    format.js { flash[:notice] = "You're welcome" }
			    render :js => "window.location = '/'"
		  	else
		  	 	format.html    
		  	 	format.js { flash[:error] = "User Not login successfully " }
		    end
    	end

	end

	def destroy
		sign_out
		flash[:notice] = "Logged Out!!"
		redirect_to root_path
	end

end
