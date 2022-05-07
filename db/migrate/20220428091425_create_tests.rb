class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, limit: 50, null: false
      t.integer :level, default: 0, null: false
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
