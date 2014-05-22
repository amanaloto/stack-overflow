class AddAccountReferencesToTables < ActiveRecord::Migration
  def up
  	add_column :questions, :user_id, :integer
  	add_column :answers, :user_id, :integer
  	add_column :comments, :user_id, :integer
  	
  	add_index :questions, :user_id
  	add_index :answers, :user_id
  	add_index :comments, :user_id
  end

  def down
  	remove_column :questions, :user_id
  	remove_column :answers, :user_id
  	remove_column :comments, :user_id

  	remove_index :questions, :user_id
  	remove_index :answers, :user_id
  	remove_index :comments, :user_id
  end
end
