class AddImageUrlToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :image_url, :string
  end
end
