class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer "user_id", null: false
      t.string :name
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
