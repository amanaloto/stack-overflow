class AddDefaultValueToVotes < ActiveRecord::Migration
  def change
    change_column :votes, :points, :integer, {default: 0}
  end
end
