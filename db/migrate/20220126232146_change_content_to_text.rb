class ChangeContentToText < ActiveRecord::Migration[7.0]
  def change
    change_column :curiosity_cards, :content, :text, null: false
  end
end
