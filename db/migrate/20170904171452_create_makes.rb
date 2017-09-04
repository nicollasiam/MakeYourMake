class CreateMakes < ActiveRecord::Migration[5.0]
  def change
    create_table :makes do |t|
      t.string :name
      t.text :description
      t.integer :likes_count
      t.boolean :public
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
