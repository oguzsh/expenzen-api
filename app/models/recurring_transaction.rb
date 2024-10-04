class RecurringTransaction < ApplicationRecord
  RECURRENCE_PATTERNS = %w[daily weekly monthly yearly].freeze

  belongs_to :financial_transaction, class_name: 'Transaction', foreign_key: 'transaction_id'
  belongs_to :user

  validates :recurrence_pattern, presence: true, inclusion: { in: RECURRENCE_PATTERNS }
  validates :recurrence_interval, numericality: { greater_than_or_equal_to: 1 }
  validates :start_date, presence: true
end
