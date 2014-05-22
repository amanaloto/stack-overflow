class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.decimal :points
      t.references :answer

      t.timestamps
    end
    add_index :comments, :answer_id
  end
end
