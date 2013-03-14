class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :description
      t.decimal :starting_balance
      t.integer :account_type

      t.timestamps
    end
  end
end
