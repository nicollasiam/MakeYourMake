class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :make, foreign_key: true

      t.timestamps
    end
  end
end
