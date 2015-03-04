class AddPaidToAllocations < ActiveRecord::Migration
  def change
    add_column :allocations, :paid, :boolean
  end
end
