class HomeController < ApplicationController
  def index
  	@profile = current_user.profile if current_user.present?
  end

  def index1
  end
end
