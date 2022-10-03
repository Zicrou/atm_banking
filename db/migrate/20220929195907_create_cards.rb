class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :card_number
      t.date :expiration_date
      t.integer :card_type, default: 0
      t.bigint :amount

      t.timestamps
    end
  end
end
