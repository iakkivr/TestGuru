class CreateBadgeTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_types do |t|
      t.string :type, null: false

      t.timestamps
    end
  end
end
