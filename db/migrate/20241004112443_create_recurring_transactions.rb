class CreateRecurringTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :recurring_transactions do |t|
      t.references :transaction, null: false, foreign_key: { to_table: :transactions }
      t.references :user, null: false, foreign_key: true
      t.string :recurrence_pattern
      t.integer :recurrence_interval
      t.date :start_date
      t.date :end_date
      t.date :last_occurrence

      t.timestamps
    end
  end
end
