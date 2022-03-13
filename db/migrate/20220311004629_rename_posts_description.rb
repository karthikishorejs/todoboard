class RenamePostsDescription < ActiveRecord::Migration[6.1]
  def up
   change_column :posts, :description, :text
  end
  def down 
    change_column :posts, :description, :string
  end
end
