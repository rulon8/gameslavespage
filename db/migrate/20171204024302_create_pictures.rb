class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :description, null: false
      t.string :image, null: false
      t.boolean :in_front_page, null: false, default: false
      t.references :post, foreign_key: true, null: true
      t.references :game, foreign_key: true, null: true

      t.timestamps
    end
  end
end
