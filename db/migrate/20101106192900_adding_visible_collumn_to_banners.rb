class AddingVisibleCollumnToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :visible, :boolean, :default => false
  end

  def self.down
    remove_column :banners, :visible
  end
end
