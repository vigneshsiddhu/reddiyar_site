class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :family_members
	has_many :members, through: :family_members
	has_many :educations
	has_many :locations
	has_many :occupations
	has_many :family_relations
	has_paper_trail

	accepts_nested_attributes_for :family_relations, allow_destroy: true
	accepts_nested_attributes_for :family_members, allow_destroy: true
	accepts_nested_attributes_for :educations, allow_destroy: true
	accepts_nested_attributes_for :locations, allow_destroy: true
	accepts_nested_attributes_for :occupations, allow_destroy: true
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>",small: "200x200>" }, default_url: "default_avatar.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	def self.verify_profile(profile)
		profile.update(verified: true)
  	end
end
