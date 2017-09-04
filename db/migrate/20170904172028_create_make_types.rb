class CreateMakeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :make_types do |t|
      t.references :make, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
