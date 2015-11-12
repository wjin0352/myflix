class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :video, index: true
  end
end
