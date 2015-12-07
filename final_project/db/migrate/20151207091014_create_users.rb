class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :current_lat
      t.integer :current_long

      t.timestamps null: false
    end
  end
end
