class AdminController < ApplicationController
	def get_verifier_profiles
		user_ids = PaperTrail::Version.where(object_changes: "---\nverified:\n- false\n- true\n", whodunnit: params[:profile_id].user.id).pluck(:item_id)
		@profiles = Profile.where(user_id: user_ids)
	end
end
