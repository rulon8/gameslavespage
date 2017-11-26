class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :description, null: false
      t.string :image, null: false
      t.references :post, foreign_key: true, null: true
      t.references :game, foreign_key: true, null: true

      t.timestamps
    end
  end
end
