class AddProfessionalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :professional, :boolean, null: false, default: false
  end
end
