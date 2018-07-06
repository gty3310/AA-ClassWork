class CreateAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.text :option, null: false
      t.integer :poll_id, null: false
    end
    add_index :answer_choices, :option
  end
end
