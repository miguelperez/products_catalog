class Category < ActiveRecord::Base
  validates_presence_of :name
  has_one :parent, :class_name => 'Category'
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  parent_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

