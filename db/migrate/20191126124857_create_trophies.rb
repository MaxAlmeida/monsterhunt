class CreateTrophies < ActiveRecord::Migration[5.1]
  def change
    create_table :trophies do |t|
      t.references :user, foreign_key: true
      t.references :level_point, foreign_key: true

      t.timestamps
    end
  end
end
