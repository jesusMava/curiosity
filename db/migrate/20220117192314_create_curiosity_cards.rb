class CreateCuriosityCards < ActiveRecord::Migration[7.0]
  def change
    create_table :curiosity_cards do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
