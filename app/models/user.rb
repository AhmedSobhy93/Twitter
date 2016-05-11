# == Schema Information
#
# Table name: users
#
#  id          :integer(4)      not null, primary key
#  fullName    :string(255)
#  email       :string(255)
#  phoneNumber :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class User < ActiveRecord::Base
	attr_accessible :fullName, :email, :phoneNumber

	before_save {|user| user.email = email.downcase }

	validates :fullName, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX} , uniqueness: {case_sensitive: false}
	validates :phoneNumber, presence: true

end
