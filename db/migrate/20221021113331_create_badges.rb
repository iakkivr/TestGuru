class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :url_image, null: false
      t.references :badge_types, null: false, foreign_key:true

      t.timestamps
    end
  end
end
