require 'byebug'
require_relative 'requires.rb'

class User
  attr_accessor :fname, :lname
  attr_reader :id
  
  def self.all
    users = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    users.map { |user| User.new(user) }
  end
  
  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT 
        * 
      FROM 
        users 
      WHERE 
        fname = ? 
      AND
        lname = ?
    SQL
    
    User.new(user.first)
  end
  
  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        users 
      WHERE 
        id = ?
    SQL
    
    User.new(user.first)
  end
  
  def initialize(option)
    @id = option["id"]
    @fname = option["fname"]
    @lname = option["lname"]
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end
  
  def authored_questions
    Question.find_by_author_id(@id)    
  end
  
  def authored_replies
    Reply.find_by_user_id(@id)
  end
  
  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end
  
  def average_karma
    karma = QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT(questions.id)) AS karma
      FROM
        users
      LEFT OUTER JOIN 
        question_likes
      ON
      question_likes.user_id = users.id
      JOIN 
        questions 
      ON
        questions.id = question_likes.question_id
      WHERE
        questions.user_id = ?
    SQL
    
    karma.first["karma"]
  end
  
  def save
    if @id
      update
      return
    end 
    
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO 
          users(fname, lname)
        VALUES
          (?, ?)
      SQL
      
      @id = QuestionsDBConnection.instance.last_insert_row_id
  end
  
  def update
    return nil unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE 
        users
      SET
        fname = ?, lname = ?
      WHERE 
        id = ?
    SQL
  end
end
