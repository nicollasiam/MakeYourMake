class CreateTelephoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :telephone_numbers do |t|
      t.references :user, foreign_key: true
      t.integer :ddd
      t.string :number
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
