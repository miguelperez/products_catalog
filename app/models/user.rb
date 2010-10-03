class User < ActiveRecord::Base
  acts_as_authentic
  
  validates_presence_of :email
  validates_presence_of :password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  #we dont want a user be able of modifying his email.
  attr_protected :email
end


# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

