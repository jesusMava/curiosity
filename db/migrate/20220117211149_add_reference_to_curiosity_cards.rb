class AddReferenceToCuriosityCards < ActiveRecord::Migration[7.0]
  def change
    add_reference :curiosity_cards, :user
  end
end
