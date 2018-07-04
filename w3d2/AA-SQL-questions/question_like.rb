require 'byebug'
require_relative 'requires.rb'

class QuestionLike
  attr_reader :id, :question_id, :user_id
  
  def self.all
    question_likes = QuestionsDBConnection.instance.execute("SELECT * FROM question_likes")
    question_likes.map { |question_like| QuestionLike.new(question_like) }
  end
  
  def self.find_by_id(id)
    question_like = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_likes 
      WHERE 
        id = ?
    SQL
    
    QuestionLike.new(question_like.first)
  end
  
  def self.likers_for_question_id(question_id)
    question_likes = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.id, users.fname, users.lname
      FROM
        question_likes 
      JOIN 
        users
      ON users.id = user_id
      WHERE
        question_id = ?
    SQL
    question_likes.map {|liker| User.new(liker)}
  end
  
  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT 
        COUNT(*) AS likes
      FROM 
        question_likes
      JOIN 
        users
      ON users.id = user_id
      WHERE
        question_id = ?
    SQL
    num_likes.first["likes"]
  end
  
  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT 
        questions.id, questions.title, questions.body, questions.user_id
      FROM 
        question_likes 
      JOIN 
        questions 
      ON 
        question_likes.question_id = questions.id
      WHERE 
        question_likes.user_id = ?
    SQL
    
    liked_questions.map {|question| Question.new(question)}
  end
  
  def self.most_liked_questions(num)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, num)
      SELECT 
        questions.id, questions.title, questions.body, questions.user_id 
      FROM 
        question_likes 
      JOIN 
        questions 
      ON 
        questions.id = question_likes.question_id 
      GROUP BY
        questions.id 
      ORDER BY
        COUNT(*) DESC 
      LIMIT 
        ?
    SQL
    
    questions.map {|question| Question.new(question)}
  end
  
  def initialize(option)
    @id = option["id"]
    @question_id = option["question_id"]
    @user_id = option["user_id"]
  end
  
  
end
