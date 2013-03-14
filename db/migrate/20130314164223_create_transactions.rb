class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.string :description
      t.string :itemno
      t.date :transaction_date
      t.boolean :fee
      t.boolean :cleared
      t.decimal :amount
      t.integer :category_id
      t.boolean :deleted

      t.timestamps
    end
  end
end
