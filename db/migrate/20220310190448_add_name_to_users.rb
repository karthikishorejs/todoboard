class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name_full, :string
  end
end
