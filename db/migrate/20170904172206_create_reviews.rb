class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.string :title
      t.text :content
      t.references :make, foreign_key: true

      t.timestamps
    end
  end
end
