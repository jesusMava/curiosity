class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.boolean :statement, null: false
      t.references :curiosity_card, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :reactions, [:user_id, :curiosity_card_id], unique: true
  end
end
