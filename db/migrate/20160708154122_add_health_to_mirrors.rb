class AddHealthToMirrors < ActiveRecord::Migration[5.0]
  def change
    add_column :mirrors, :health, :boolean
  end
end