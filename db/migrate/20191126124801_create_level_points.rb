class CreateLevelPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :level_points do |t|
      t.integer :level
      t.string :category
      t.integer :quantity

      t.timestamps
    end
  end
end
