class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :category_id
  
  validates_uniqueness_of :name
  
  belongs_to :category
  has_many :images, :class_name => "ProductImage"
  
  accepts_nested_attributes_for :images, :allow_destroy => true
end



# == Schema Information
#
# Table name: products
#
#  id                     :integer(4)      not null, primary key
#  name                   :string(255)
#  price                  :float
#  visible                :boolean(1)      default(FALSE)
#  description            :text
#  additional_information :text
#  created_at             :datetime
#  updated_at             :datetime
#  category_id            :integer(4)
#

