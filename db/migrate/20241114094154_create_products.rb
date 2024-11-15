class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :compare_at
      t.text :description

      t.timestamps
    end
  end
end
