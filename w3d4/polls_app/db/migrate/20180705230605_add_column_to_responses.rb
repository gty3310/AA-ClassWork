class AddColumnToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :option_id, :integer
  end
end
