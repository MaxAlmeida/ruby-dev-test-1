class CreateDirectories < ActiveRecord::Migration[5.2]
  def change
    create_table :directories do |t|
      t.string :path
      t.references :directory, foreign_key: true

      t.timestamps
    end
  end
end
