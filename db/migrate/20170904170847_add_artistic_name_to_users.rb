class AddArtisticNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :artistic_name, :string
  end
end
