class AddOperatingSystemIdToComputer < ActiveRecord::Migration[5.0]
  def change
    add_column :computers, :operating_system_id, :integer
  end
end
