class FamilyRelation < ActiveRecord::Base
  belongs_to :profile
  has_paper_trail
  has_attached_file :family_image, styles: { medium: "300x300>", thumb: "100x100>",small: "200x200>" }, default_url: "default_avatar.png"
  validates_attachment_content_type :family_image, content_type: /\Aimage\/.*\Z/

end
