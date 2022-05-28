class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :merchant
      t.references :shopper
      t.float :amount
      t.float :disbursed_amount
      t.float :fee
      t.integer :status, default: 0
      t.datetime :completed_at
      t.datetime :disbursed_at

      t.timestamps
    end
  end
end
