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
  
  #Defining the tags a product can have.
  acts_as_taggable
  
  # returns the list of tags of this product
  def product_tags
    self.tag_list.join(", ")
  end
  
  # sets the list of tags of this product
  def product_tags=(values)
    self.tag_list = values
  end
  
  # returns an array of related products, based on tags.
  def related_products
    return [] if self.tags.empty?
    products = Product.visible.tagged_with(self.tags.map{|tag| tag.to_s}, :any => true)
    products - [self]
  end
  
  # Before assigning a visible value to the product it stores the previous one, so we can check the validations against
  # the visibility of the project
  def visible=(value)
    @old_visible_value = self.new_record? ? value : self.visible
    super(value)
  end

  private
  # checks the validations of this product before updating it.
  def validations_on_update
    check_if_can_be_set_to_visible_against_price if Validations.on_update('product','not_visible_if_price_lower_than_zero')
    check_if_can_be_set_to_visible_against_images if Validations.on_update('product','not_visible_if_no_images')
  end
  
  # checks if this product can be set to visible against the price of the product.
  # This validation checks that the product has a price higher than zero in order to be visible.
  def check_if_can_be_set_to_visible_against_price
    return true if visibility_changed? && !visible
    unless self.price && self.price > 0
      errors.add("Can't update the product visibility because the price is not set") 
      false
    end
  end
  
  # checks if this product can be set to visible against the number of images of the product.
  # This validation checks that the product has at least one image associated to it in order to be visible.
  def check_if_can_be_set_to_visible_against_images
    return true if visibility_changed? && !visible
    if self.images.empty?
      errors.add("Can't update the product visibility because the product has no images") 
      false
    end
  end
  
  # Checks wether the visibility of the product changed.
  def visibility_changed?
    !(@old_visible_value == visible)
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

