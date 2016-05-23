class MainController < ApplicationController
include SessionsHelper

  def index
  	@user = User.new
  	@micropost = current_user.microposts.build if signed_in?
  	@microposts = current_user.microposts.paginate(page: params[:page],:per_page => 2)
  end
end
