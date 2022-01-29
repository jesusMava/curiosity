class AddExtraColumnsToCuriosity < ActiveRecord::Migration[7.0]
  def change
    add_column :curiosity_cards, :truthful, :boolean
    add_column :curiosity_cards, :published_at, :datetime
    add_column :curiosity_cards, :extra_comment, :text

    rename_column :curiosity_cards, :action, :category

    change_column_null(:curiosity_cards, :category, false)

    change_column_default(:curiosity_cards, :category, 0)
  end
end
