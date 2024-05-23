class RemoveColumnTest < ActiveRecord::Migration[7.0]
  def change
    remove_column :tests, :user, :string
  end
end
