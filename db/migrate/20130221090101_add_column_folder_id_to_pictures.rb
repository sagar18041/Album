class AddColumnFolderIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :folder_id, :integer
  end
end
