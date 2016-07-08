class AddFilenameToMirrors < ActiveRecord::Migration[5.0]
  def change
    add_column :mirrors, :filename, :string
  end
end