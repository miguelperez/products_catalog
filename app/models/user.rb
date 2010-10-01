class User < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
end

# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

