class Transaction < ApplicationRecord
  TRANSACTION_TYPES = %w[expense income transfer].freeze

  belongs_to :user
  belongs_to :account
  belongs_to :category

  has_one :recurring_transaction, foreign_key: :transaction_id, dependent: :destroy

  validates :amount, presence: true, numericality: { greater_than: 0 }, if: -> { transaction_type == "income" }
  validates :amount, presence: true, numericality: { less_than: 0 }, if: -> { transaction_type == "expense" }
  validates :date, presence: true
  validates :category, presence: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }
end