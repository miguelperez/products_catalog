class CreateProductImages < ActiveRecord::Migration
  def self.up
    create_table :product_images do |t|
      t.integer :product_id
      t.string    :graphic_file_name
      t.string    :graphic_content_type
      t.integer   :graphic_file_size
      t.datetime  :graphic_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :product_images
  end
end
