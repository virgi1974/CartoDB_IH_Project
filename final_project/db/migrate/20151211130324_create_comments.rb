class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true 
      t.references :map, index: true 

      t.string :content
      
      t.timestamps null: false
    end
  end
end
