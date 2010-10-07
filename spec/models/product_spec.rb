require 'spec_helper'

describe Product do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :price => 1.5,
      :status => "value for status",
      :description => "value for description",
      :additional_information => "value for additional_information"
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
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
#

