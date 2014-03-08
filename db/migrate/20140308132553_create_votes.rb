class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :motion_id, null: false, foreign_key: { on_delete: :cascade , on_update: :cascade }
      t.integer :user_id, null: false, foreign_key: { on_delete: :restrict , on_update: :cascade }
      t.string :response, null: true
      t.string :vote_token, null: true

      t.timestamps
    end

    add_index :votes, [:motion_id, :user_id], unique: true
    add_index :votes, :vote_token, unique: true
  end
end
