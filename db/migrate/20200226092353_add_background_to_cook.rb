class AddBackgroundToCook < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :background, :string
  end
end
