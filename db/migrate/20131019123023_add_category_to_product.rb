class AddCategoryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category_id, :int
  end
end
