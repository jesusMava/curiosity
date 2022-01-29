class AddExtraColumnsToCuriosity < ActiveRecord::Migration[7.0]
  def change
    add_column :curiosity_cards, :truthful, :boolean
    add_column :curiosity_cards, :published, :boolean, default: false
    add_column :curiosity_cards, :extra_comment, :text

    rename_column :curiosity_cards, :action, :category

    change_column_null(:curiosity_cards, :category, false)
  end
end
