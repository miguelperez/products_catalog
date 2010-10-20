class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string    :name
      t.string    :description
      
      t.string    :graphic_file_name
      t.string    :graphic_content_type
      t.integer   :graphic_file_size
      t.datetime  :graphic_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
