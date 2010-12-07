require 'spec_helper'

describe Product do
  context "testing the named scopes" do
    it "should return only the visible products when calling the visible named scope" do
      Product.destroy_all
      Factory(:product, :visible => true)
      Factory(:product, :visible => true)
      Factory(:product, :visible => true)
      Factory(:product)
      Factory(:product)
      Factory(:product)
      Product.visible.count.should == 3
      Product.all.count.should == 6
    end
  end
  
  context "price named scopes" do
    before(:each) do
      Product.destroy_all
      Factory(:product, :visible => true, :price => 1)
      Factory(:product, :visible => true, :price => 2)
      Factory(:product, :visible => true, :price => 3)
      Factory(:product, :price => 4)
      Factory(:product, :price => 5)
      Factory(:product, :price => 6)
    end
    it "should return the products with price lower or equal than a value" do
      Product.price_lower_than(3).count.should == 3
      Product.price_lower_than(4).count.should == 4
      #we are nesting the visible and lower than scopes
      Product.visible.price_lower_than(4).count.should == 3
    end
    it "should return the products with price between the limits" do
      Product.price_between(1,3).count.should == 3
      Product.price_between(1,4).count.should == 4
      #we are nesting the visible and lower than scopes
      Product.visible.price_between(1,4).count.should == 3
    end
  end
  
  context "asking for related products" do
    it "should return the related products" do
      pr1 = Factory(:product, :visible => true, :price => 1)
      pr1.tag_list = "tag1, tag2"
      pr1.save
      pr2 = Factory(:product, :visible => true, :price => 1)
      pr2.tag_list = "tag2"
      pr2.save
      
      pr1.related_products.should == [pr2]
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

