require 'spec_helper'

describe Category do
  context "a category" do
    it "should not be deleteable if products are associated to it." do
      category = Factory(:category)
      Factory(:product, :category_id => category.id)
      lambda do 
        category.destroy
      end.should change(Category, :count).by(0)
    end
    it "should be deleteable if no products are associated to it." do
      category = Factory(:category)
      lambda do 
        category.destroy
      end.should change(Category, :count).by(-1)
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
#  lft        :integer(4)
#  rgt        :integer(4)
#

