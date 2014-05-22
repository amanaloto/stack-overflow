class AddDefaultValueToQuestions < ActiveRecord::Migration
  def change
  	change_column :questions, :points, :decimal, {default: 0}
  end
end
