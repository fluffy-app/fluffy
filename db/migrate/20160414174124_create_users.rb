class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_path
      t.string :background_image
      t.integer :gender
      t.integer :age
      t.string :address
      t.boolean :delete

      t.timestamps null: false
    end
  end
end
