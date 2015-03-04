class RenamePercentageToShare < ActiveRecord::Migration
  def change
    rename_column :allocations, :percentage, :share
  end
end
