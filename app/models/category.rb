class Category < ActiveRecord::Base
  acts_as_nested_set
  
  cattr_reader :per_page
  @@per_page = 10
  
  validates_presence_of :name
  belongs_to :parent, :class_name => 'Category'
  has_many :children, :foreign_key => 'parent_id', :class_name => 'Category', :dependent => :destroy
  
  has_many :products
  delegate :name, :to => :parent, :prefix => true, :allow_nil => true
  
  before_destroy :check_association_with_projects
  
  private
  
  def check_association_with_projects
    if products.size > 0
      errors.add("Category","Can't be deleted. Delete the products associated to it first.")
      return false
    end
  end
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

