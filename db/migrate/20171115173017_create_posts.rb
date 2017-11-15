class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.datetime :date, null: false
      t.string :description
      t.references :user, foreign_key: true, null: false
      t.string :categories, array: true
      t.string :tags, array: true

      t.timestamps
    end
  end
end
