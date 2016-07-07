class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
