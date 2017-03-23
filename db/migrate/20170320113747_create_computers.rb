class CreateComputers < ActiveRecord::Migration[5.0]
  def change
    create_table :computers do |t|
      t.string :city
      t.boolean :warranty
      t.string :vendor
      t.integer :serial_number

      t.timestamps
    end
  end
end
