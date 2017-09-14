class RemoveTelephoneNumberFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :telephone_number, :string
  end
end
