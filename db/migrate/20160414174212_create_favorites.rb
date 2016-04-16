class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :favorite_user_id, index: true

      t.timestamps null: false
    end
  end
end
