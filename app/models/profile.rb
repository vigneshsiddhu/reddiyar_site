class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :family_members
	has_paper_trail
	accepts_nested_attributes_for :family_members, allow_destroy: true
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>",small: "200x200>" }, default_url: "default_avatar.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
