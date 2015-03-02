class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :name
      t.integer :amount
      t.text :description
      t.integer :group_id
      t.datetime :due_date

      t.timestamps null: false
    end
  end
end
