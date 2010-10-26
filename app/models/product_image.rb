class ProductImage < ActiveRecord::Base
  belongs_to :product
  has_attached_file :graphic, 
                    :styles => { :medium => "300x300#",
                                 :thumb => "100x100#",
                                 :small_thumb => "30x30#"}
  validates_attachment_content_type :graphic, :content_type=>['image/jpeg', 'image/png', 'image/gif'] 
  
end


# == Schema Information
#
# Table name: product_images
#
#  id                   :integer(4)      not null, primary key
#  product_id           :integer(4)
#  graphic_file_name    :string(255)
#  graphic_content_type :string(255)
#  graphic_file_size    :integer(4)
#  graphic_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

