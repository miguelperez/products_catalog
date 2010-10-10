require 'spec_helper'

describe ProductImage do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    ProductImage.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: product_images
#
#  id                 :integer(4)      not null, primary key
#  product_id         :integer(4)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

