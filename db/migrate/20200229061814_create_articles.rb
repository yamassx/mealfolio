class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :string
      t.string :content
      t.string :text
      t.string :image
      t.string :string
      t.string :cook
      t.string :references

      t.timestamps
    end
  end
end
