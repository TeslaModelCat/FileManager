class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :notification_type
      t.boolean :is_read, null: false, default: false

      t.references :user, null: false

      t.timestamps
    end
  end
end
