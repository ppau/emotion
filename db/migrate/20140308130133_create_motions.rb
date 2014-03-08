class CreateMotions < ActiveRecord::Migration
  def change
    create_table :motions do |t|
      t.text :text, null: false
      t.integer :group_id, null: false, foreign_key: { on_delete: :cascade , on_update: :cascade }
      t.integer :user_id, null: false, foreign_key: { on_delete: :restrict , on_update: :cascade }
      t.timestamps
    end
  end
end
