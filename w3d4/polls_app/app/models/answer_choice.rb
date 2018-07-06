# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  option      :text             not null
#  question_id :integer
#

class AnswerChoice < ApplicationRecord
  validates :option, presence: true
  validates :question_id, presence: true
  
  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question
    
  # belongs_to :poll,
  #     through: :question,
  #     source: :poll
      
  has_many :responses,
    primary_key: :id,
    foreign_key: :option_id,
    class_name: :Response
end
