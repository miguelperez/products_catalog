class Subscriber < ActiveRecord::Base
  
  validates_presence_of :email
  validates_presence_of :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
end

# == Schema Information
#
# Table name: subscribers
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

