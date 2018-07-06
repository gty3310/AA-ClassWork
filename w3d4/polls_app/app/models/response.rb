# == Schema Information
#
# Table name: responses
#
#  id         :bigint(8)        not null, primary key
#  answer     :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  option_id  :integer
#

class Response< ApplicationRecord
  validates :user_id, presence: true
  
  belongs_to :chosen_answer,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :AnswerChoice
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  # has_one :question,
  #   through: :chosen_answer,
  #   source: :question
  
  def question
    self.question
  end
  
  def sibling_reponses
    question.responses
  end
  
  def not_duplicate_reponse
    
  end
  
end
