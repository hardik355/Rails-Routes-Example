class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.text :items
      t.string :ip_address

      t.timestamps
    end
  end
end
