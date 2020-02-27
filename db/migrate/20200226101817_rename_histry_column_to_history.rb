class RenameHistryColumnToHistory < ActiveRecord::Migration[5.2]
  def change
    rename_column :cooks, :histry, :history
  end
end
