class AddCategoryToGame < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :category, index: true
  end
end
