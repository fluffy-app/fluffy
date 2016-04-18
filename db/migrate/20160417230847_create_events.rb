class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :detail
      t.date :schedule_date
      t.string :place
      t.boolean :delete_flag
      t.boolean :close_flag
      t.references :thing, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
