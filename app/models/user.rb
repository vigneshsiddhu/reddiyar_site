class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:email]

  has_one :profile, foreign_key: 'user_id'

  after_create :create_profile

  def create_profile
	profile = Profile.create(email: self.email, user_id: self.id)
  end
end
