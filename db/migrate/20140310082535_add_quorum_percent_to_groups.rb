class AddQuorumPercentToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :quorum_percentage, :integer, null: false, default: 100
  end
end
