class AddNameToMotions < ActiveRecord::Migration
  def up
    add_column :motions, :name, :string, null: false, default: ''
    execute 'UPDATE motions SET name = left(text, 20)'
    change_column :motions, :name, :string, null: false
  end
end
