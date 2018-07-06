class FixResponsesTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :answer
  end
end
