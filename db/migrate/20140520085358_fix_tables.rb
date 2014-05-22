class FixTables < ActiveRecord::Migration
  def up
  	change_column :questions, :points, :integer, {default: 0}
  	change_column :answers, :points, :integer, {default: 0}
  	change_column :comments, :points, :integer, {default: 0}
  end

  def down
  	change_column :questions, :points, :decimal, {default: 0}
  	change_column :answers, :points, :decimal, {default: 0}
  	change_column :comments, :points, :decimal, {default: 0}
  end
end
