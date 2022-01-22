class AddAccionToCuriosity < ActiveRecord::Migration[7.0]
  def change
    add_column :curiosity_cards, :action, :integer
  end
end
