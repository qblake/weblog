class RenameComments < ActiveRecord::Migration
  def change
    rename_table :comments, :post_comments
  end
end
