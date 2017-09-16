class AddSlugToTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :types, :slug, :string
  end
end
