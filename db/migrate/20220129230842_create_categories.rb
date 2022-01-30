class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_reference :curiosity_cards, :category
    remove_column :curiosity_cards, :category
  end
end
