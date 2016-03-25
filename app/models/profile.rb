class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :family_members
	accepts_nested_attributes_for :family_members
end
