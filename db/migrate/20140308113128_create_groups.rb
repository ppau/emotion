class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, force: true do |t|
      t.string :name, null: false
      t.string :uuid, null: false

      t.timestamps
    end

    add_index :groups, :name
    add_index :groups, :uuid, unique: true
  end
end
