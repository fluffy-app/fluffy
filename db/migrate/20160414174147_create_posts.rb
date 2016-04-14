class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :comment
      t.string :image_path
      t.references :thing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
