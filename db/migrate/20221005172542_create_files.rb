class CreateFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :files do |t|
      t.string :name
      t.string :url
      t.string :size

      t.references :user, null: false

      t.timestamps
    end
  end
end
