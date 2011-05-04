class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :address, :text
      t.column :pay_type, :string
      t.column :shipped_at, :datetime 

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end

