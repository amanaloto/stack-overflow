class CreateVoteQuestions < ActiveRecord::Migration
  def change
    create_table :vote_questions do |t|
      t.integer :points
      t.references :user
      t.references :question

      t.timestamps
    end
    add_index :vote_questions, :user_id
    add_index :vote_questions, :question_id
  end
end
