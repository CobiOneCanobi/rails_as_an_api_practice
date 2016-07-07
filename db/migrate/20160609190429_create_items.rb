class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.decimal :price
      t.integer :seller_id
      t.string :status_id
      t.text :requirements
      t.date :published_at

      t.timestamps null: false
    end
  end
end
