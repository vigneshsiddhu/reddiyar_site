class FamilyMember < ActiveRecord::Base
	belongs_to :profile
  belongs_to :member, class_name: 'Profile', foreign_key: "member_id"
end
