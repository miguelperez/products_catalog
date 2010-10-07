class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :visible, :default => false
      t.text :description
      t.text :additional_information

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
