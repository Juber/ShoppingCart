class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :title, :string 
      t.column :description, :string, :limit => 50, :null => false
      t.column :price, :decimal, :precission => 8, :scale => 2, :default => 0, :null => false
      t.column :image_url, :string
      t.column :category_id, :integer, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
