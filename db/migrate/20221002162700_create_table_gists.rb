class CreateTableGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.references :user, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end