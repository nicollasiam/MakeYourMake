class AddSlugToMakes < ActiveRecord::Migration[5.0]
  def change
    add_column :makes, :slug, :string
  end
end
