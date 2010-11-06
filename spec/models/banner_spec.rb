require 'spec_helper'

describe Banner do
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
#  visible              :boolean(1)      default(FALSE)
#

