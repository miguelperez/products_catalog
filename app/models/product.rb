class Product < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :category_id

  validates_uniqueness_of :name

  belongs_to :category
  has_many :images, :class_name => "ProductImage"

  accepts_nested_attributes_for :images, :allow_destroy => true

  before_update :validations_on_update

  named_scope :visible, :conditions => {:visible => true}
  
  named_scope :price_lower_than, lambda { |limit_price|
    { :conditions => ['price <= ?', limit_price] }
  }
  
  named_scope :price_between, lambda { |lower_price, higher_price|
    { :conditions => ['price <= ? and price >= ?', higher_price, lower_price] }
  }

  def validations_on_update
    check_if_can_be_set_to_visible if Validations.on_update('product','not_visible_if_price_lower_than_zero')
  end

  private
  #checks if this product can be set to visible.
  def check_if_can_be_set_to_visible
    return true unless visible
    unless self.price && self.price > 0
      errors.add("Can't update the product visibility because the price is not set") 
      false
    end
  end
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

