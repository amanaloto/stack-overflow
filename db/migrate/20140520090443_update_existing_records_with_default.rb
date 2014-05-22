class UpdateExistingRecordsWithDefault < ActiveRecord::Migration
  def up
  	Question.update_all(:points => 0)
    Answer.update_all(:points => 0)
    Comment.update_all(:points => 0)
  end

  def down
    Question.update_all(:points => nil)
    Answer.update_all(:points => nil)
    Comment.update_all(:points => nil)
  end
end
