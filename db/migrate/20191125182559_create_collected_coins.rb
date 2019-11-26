class CreateCollectedCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :collected_coins do |t|
      t.integer :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
