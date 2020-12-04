class ChangePlatformNameToPlatformTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :platforms, :name, :title
  end
end
