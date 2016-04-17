class RenameDeleteColumnToHide < ActiveRecord::Migration
  def change
    # [形式] rename_column(テーブル名, 変更前のカラム名, 変更後のカラム名)
    rename_column :users, :delete, :hide
  end
end
