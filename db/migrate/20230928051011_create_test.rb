class CreateTest < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :user

      t.timestamps
    end
  end
end
