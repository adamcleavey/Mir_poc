class AddFormatToMirror < ActiveRecord::Migration[5.0]
  def change
    add_column :mirrors, :format, :string
  end
end