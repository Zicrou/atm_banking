class RemoveSexeFromCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :sexe, :string
    remove_column :cards, :sexe, :string
  end
end
