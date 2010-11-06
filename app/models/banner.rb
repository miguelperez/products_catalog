class Banner < ActiveRecord::Base
  include PaperclipValidations
  
  cattr_reader :per_page
  @@per_page = 10
  
  has_attached_file :graphic, 
                    :styles => { :normal => "600x270#",
                                 :thumb => "170x76#"},
                    #this one tells where to save the file
                    :path => ":rails_root/public/system/:class/:id/:style/:filename",
                    #this one tells where to fetch the file
                    :url  => "/system/:class/:id/:style/:filename"

  validates_presence_of :name
  validates_presence_of :graphic_file_name
  
  validates_attachment_content_type :graphic, :content_type=>['image/jpeg', 'image/png', 'image/gif'] 
  
  named_scope :visible, :conditions => {:visible => true}
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

