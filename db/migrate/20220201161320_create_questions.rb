class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :game, null: false, foreign_key: true
      t.references :curiosity_card, null: false, foreign_key: true
      t.integer :score, null: false, default: 0
      t.boolean :answer

      t.timestamps
    end
  end
end
