class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :email, null: false
      t.string :body, null: false
      t.boolean :resolved,  null: false, default: false

      t.timestamps
    end
  end
end
