class HomeController < ApplicationController
  def index
  	@profile = current_user.profile if current_user.present?
  end

  def search
    @profiles = Profile.where("name LIKE ?", "%#{params["name"]}%")
  end
 

  def index2
  	@profile = current_user.profile if current_user.present?
  end
  
end
