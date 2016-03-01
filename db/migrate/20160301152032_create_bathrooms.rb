class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.string :location, null: false
      t.integer :author_rating
      t.string :description, null: false
      t.string :picture_url
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
