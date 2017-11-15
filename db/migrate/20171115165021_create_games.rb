class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name, null: false, unique: true
      t.string :description
      t.string :information
      t.string :requirements

      t.timestamps
    end
  end
end
