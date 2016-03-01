class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.integer :user_id, null: false
      t.integer :bathroom_id, null: false
      t.timestamps null: false
    end
  end
end
