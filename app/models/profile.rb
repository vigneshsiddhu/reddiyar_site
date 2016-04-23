class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :family_members
	has_many :educations
	has_one :location
	has_paper_trail
	accepts_nested_attributes_for :family_members, allow_destroy: true
	accepts_nested_attributes_for :educations, allow_destroy: true
	accepts_nested_attributes_for :location, allow_destroy: true
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>",small: "200x200>" }, default_url: "default_avatar.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	def self.verify_profile(profile)
  		if current_user.user_roles.pluck(:role).include?(0,3)
  			profile.update(verified: true)
  			return
  		else
  			return false
  		end
  	end
end
