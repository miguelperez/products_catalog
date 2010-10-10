class ProductImage < ActiveRecord::Base
  belongs_to :product
  has_attached_file :graphic, 
                    :styles => { :medium => "300x331#",
                                 :thumb => "100x100#" }
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

