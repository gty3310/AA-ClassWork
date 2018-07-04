require 'sqlite3'
require 'singleton'
require_relative 'requires.rb'

class QuestionsDBConnection < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end 

class Question
  attr_accessor :title, :body
  attr_reader :id, :user_id
  
  def self.all
    questions = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    questions.map {|question| Question.new(question)}
  end
  
  def self.find_by_id(id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions
      WHERE 
        id = ?
    SQL
    
    Question.new(question.first)
  end
  
  def self.find_by_author_id(author_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM 
        questions
      WHERE 
        user_id = ?
    SQL
    
    questions.map{ |question| Question.new(question)}
  end
  
  def self.most_followed(num)
    QuestionFollow.most_followed_questions(num)
  end
  
  def self.most_liked(num)
    QuestionLike.most_liked_questions(num)
  end
  
  def initialize(option)
    @id = option['id']
    @title = option['title']
    @body = option['body']
    @user_id = option['user_id']
  end
  
  def author
    User.find_by_id(@user_id)
  end
  
  def replies 
    Reply.find_by_question_id(@id)
  end 
  
  def followers
    QuestionFollow.followers_for_question_id(@id)
  end
  
  def likers 
    QuestionLike.likers_for_question_id(@id)
  end
  
  def num_likes 
    QuestionLike.num_likes_for_question_id(@id)
  end
  
  def save
    if @id
      update
      return
    end 
    
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @user_id)
        INSERT INTO 
          users(title, body, user_id)
        VALUES
          (?, ?, ?)
      SQL
      
      @id = QuestionsDBConnection.instance.last_insert_row_id
  end
  
  def update
    return nil unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @user_id, @id)
      UPDATE 
        users
      SET
        fname = ?, lname = ?, user_id = ?
      WHERE 
        id = ?
    SQL
  end
    
end
