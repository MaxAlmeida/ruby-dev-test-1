class RenamePathToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :directories, :path, :name
  end
end
