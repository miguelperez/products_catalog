require 'spec_helper'

describe Banner do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Banner.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: banners
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  description          :string(255)
#  graphic_file_name    :string(255)
#  graphic_content_type :string(255)
#  graphic_file_size    :integer(4)
#  graphic_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

