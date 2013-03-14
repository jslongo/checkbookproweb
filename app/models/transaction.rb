class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :category_id, :cleared, :deleted, :description, :fee, :itemno, :transaction_date
end
