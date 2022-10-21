class AddDetailsToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
    add_column :test_passages, :correct_questions, :integer, default: 0
    add_column :test_passages, :score, :decimal
  end
end

