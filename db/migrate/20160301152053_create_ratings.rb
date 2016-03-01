class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :number, null: false
      t.integer :user_id, null: false
      t.integer :bathroom_id, null: false

      t.timestamps null: false
    end
  end
end
