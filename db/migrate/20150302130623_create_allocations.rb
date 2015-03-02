class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :invoice_id
      t.integer :user_id
      t.integer :percentage

      t.timestamps null: false
    end
  end
end
