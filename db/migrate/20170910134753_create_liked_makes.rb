class CreateLikedMakes < ActiveRecord::Migration[5.0]
  def change
    create_table :liked_makes do |t|
      t.references :user, foreign_key: true
      t.references :make, foreign_key: true

      t.timestamps
    end
  end
end
