require 'byebug'
require_relative 'requires.rb'

class QuestionFollow
  attr_reader :id, :question_id, :user_id
  
  def self.all
    question_follows = QuestionsDBConnection.instance.execute("SELECT * FROM question_follows")
    question_follows.map { |question_follow| QuestionFollow.new(question_follow) }
  end
  
  def self.find_by_id(id)
    question_follow = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_follows 
      WHERE 
        id = ?
    SQL
    
    QuestionFollow.new(question_follow.first)
  end
  
  def self.most_followed_questions(num)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, num)
      select 
      questions.id, title, body, question_follows.user_id 
      from 
      question_follows 
      join questions 
      on question_id = questions.id 
      group by question_id 
      order by count(*) desc
      limit ?
    SQL
    questions.map {|question| Question.new(question)}
  end
  
  
  def self.followers_for_question_id(question_id)
    followers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT 
        users.id, users.fname, users.lname
      FROM 
        question_follows 
      JOIN 
        users 
      ON 
        question_follows.user_id = users.id
      WHERE 
        question_follows.question_id = ?
    SQL
    
    followers.map { |follower| User.new(follower)}
  end
  
  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.id, questions.title, questions.body, questions.user_id
      FROM
        question_follows
      JOIN
        questions
      ON
        question_follows.question_id = questions.id
      Where
        question_follows.user_id = ?
    SQL
    questions.map {|question| Question.new(question)}
  end
  
  def initialize(option)
    @id = option["id"]
    @question_id = option["question_id"]
    @user_id = option["user_id"]
  end
  
end
