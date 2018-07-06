class FixResponseTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :question_id
  end
end
