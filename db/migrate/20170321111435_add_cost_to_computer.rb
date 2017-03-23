class AddCostToComputer < ActiveRecord::Migration[5.0]
  def change
    add_column :computers, :cost, :integer
  end
end
