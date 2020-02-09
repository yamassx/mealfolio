class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :title, null: false
      t.text :tecnic
      t.text :detale
      t.references :cook, foreign_key: true
      t.timestamps
    end
  end
end
