class CreateMeToos < ActiveRecord::Migration
  def change
    create_table :me_toos do |t|
      t.integer :passion
      t.boolean :accepted
      t.boolean :delete
      t.references :thing, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
