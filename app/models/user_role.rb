class UserRole < ActiveRecord::Base
	belongs_to :user

	enum role: [:super_admin, :admin, :profile_verifier]
end
