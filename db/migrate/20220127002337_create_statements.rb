class CreateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :statements do |t|
      t.boolean :is_real, null: false
      t.references :curiosity_card, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :statements, [:user_id, :curiosity_card_id], unique: true
  end
end
