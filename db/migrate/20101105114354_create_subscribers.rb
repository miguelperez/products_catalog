class CreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :subscribers
  end
end
