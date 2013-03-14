class Account < ActiveRecord::Base
  attr_accessible :account_name, :account_type, :description, :starting_balance
end
