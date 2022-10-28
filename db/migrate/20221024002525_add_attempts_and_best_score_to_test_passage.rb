class AddAttemptsAndBestScoreToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :best_score, :decimal, default: 0
    add_column :test_passages, :attempts, :integer, default: 0
    add_column :test_passages, :passed, :boolean, default: false
  end
end
