class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :title
      t.integer :passion
      t.date :schedule
      t.boolean :delete
      t.string :image_path
      t.boolean :close
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
