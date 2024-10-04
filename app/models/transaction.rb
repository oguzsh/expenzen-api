class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :category

  has_one :recurring_transaction, foreign_key: :financial_transaction_id, dependent: :destroy
end
