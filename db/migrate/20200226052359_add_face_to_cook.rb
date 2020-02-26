class AddFaceToCook < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :face, :string
  end
end
