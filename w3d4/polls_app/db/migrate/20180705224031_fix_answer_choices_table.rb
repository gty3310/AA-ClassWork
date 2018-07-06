class FixAnswerChoicesTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :answer_choices, :poll_id
  end
end
