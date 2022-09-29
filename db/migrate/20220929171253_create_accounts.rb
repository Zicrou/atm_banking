class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :phone_number
      t.date :date_of_birth
      t.integer :sexe, default: 0
      t.string :profession

      t.timestamps
    end
  end
end
