class UserRole < ActiveRecord::Base
	enum role:[ :admin, :profile_validator]
	belongs_to :user
end
