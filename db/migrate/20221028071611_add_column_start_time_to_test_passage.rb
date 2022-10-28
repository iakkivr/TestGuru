class AddColumnStartTimeToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :start_time, :datetime
  end
end
