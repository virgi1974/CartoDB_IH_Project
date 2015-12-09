class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.references :user, index: true 
      t.integer :user_id
      t.string :table
      t.string :city
      t.string :state
      t.datetime :date1
      t.datetime :date2
      t.boolean :shared
      t.string :description

      t.timestamps null: false
    end
  end
end
