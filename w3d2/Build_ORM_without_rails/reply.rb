require 'byebug'
require_relative 'requires.rb'

class Reply
  attr_accessor :body
  attr_reader :id, :parent_id, :question_id, :user_id
  
  def self.all
    replies = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
    replies.map { |reply| Reply.new(reply) }
  end
  
  def self.find_by_id(id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        id = ?
    SQL
    
    Reply.new(reply.first)
  end
  
  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        replies
      WHERE 
        user_id = ?
    SQL
    
    replies.map{ |reply| Question.new(reply)}
  end
  
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        replies
      WHERE 
        question_id = ?
    SQL
    
    replies.map{ |reply| Question.new(reply)}
  end
  
  
  def initialize(option)
    @id = option["id"]
    @body = option["body"]
    @parent_id = option["parent_id"]
    @question_id = option["question_id"]
    @user_id = option["user_id"]
  end
  
  def author 
    User.find_by_id(@user_id)
  end
  
  def question 
    Question.find_by_id(@question_id)
  end
  
  def parent_reply
    Reply.find_by_id(@parent_id)
  end
  
  def child_replies
    Reply.all.select {|reply| @id == reply.parent_id}
  end
  
  def save
    if @id
      update
      return
    end 
    
    QuestionsDBConnection.instance.execute(<<-SQL, @body, @parent_id, @question_id, @user_id)
        INSERT INTO 
          users(body, parent_id, question_id, user_id)
        VALUES
          (?, ?, ?, ?)
      SQL
      
      @id = QuestionsDBConnection.instance.last_insert_row_id
  end
  
  def update
    return nil unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @body, @parent_id, @question_id, @user_id, @id)
      UPDATE 
        users
      SET
        body = ?, parent_id = ?, question_id = ?, user_id = ?
      WHERE 
        id = ?
    SQL
  end
    
end
