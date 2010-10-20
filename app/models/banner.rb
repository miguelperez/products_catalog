class Banner < ActiveRecord::Base
  has_attached_file :graphic, 
                    :styles => { :normal => "600x270#",
                                 :normal => "170x76#"}
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

