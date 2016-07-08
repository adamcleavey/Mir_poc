class CreateMirrors < ActiveRecord::Migration[5.0]
  def change
    create_table :mirrors do |t|
      t.string :source
      t.integer :frequency
      t.datetime :last_updated
      t.string :name
      t.text :notes
      t.string :mirrored_url

      t.timestamps
    end
  end
end
