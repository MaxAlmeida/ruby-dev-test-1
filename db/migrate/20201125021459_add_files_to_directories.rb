class AddFilesToDirectories < ActiveRecord::Migration[5.2]
  def change
    add_column :directories, :files, :json
  end
end
