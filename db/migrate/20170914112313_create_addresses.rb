class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :street
      t.integer :number
      t.string :zip_code
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
