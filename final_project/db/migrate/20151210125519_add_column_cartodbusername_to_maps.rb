class AddColumnCartodbusernameToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :cartodb_username, :string
  end
end
