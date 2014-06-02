namespace :populate do
  
  desc "Populates the Question model with records with user_id 1"
  task :populate_question_1 => :environment do 
    @user = User.first
    (0..50).each do
      @user.questions.create!(
        :name => @user.email,
        :title => 'Admin',
        :question => 'Why?')
    end
  end

  desc "Populates the Question model with records with user_id 2"
  task :populate_question_2 => :environment do
    @user = User.find(2)
    (0..50).each do
      @user.questions.create!(
        :name => @user.email, 
        :title => 'Wew', 
        :question => 'How?')
    end
  end

  desc "Populates the Question model with records with user_id 3"
  task :populate_question_3 => :environment do
    @user = User.find(3)
    (0..50).each do
      @user.questions.create!(
        :name => @user.email, 
        :title => 'Test', 
        :question => 'When?')
    end
  end
  
  desc "Run all populates"
  task :populate_all => [:populate_question_1, :populate_question_2, :populate_question_3] do
    puts "Done populating the Question model!"
  end
end