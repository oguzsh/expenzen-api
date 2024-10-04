class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.decimal :amount
      t.string :transaction_type
      t.text :description
      t.datetime :date
      t.boolean :is_recurring

      t.timestamps
    end
  end
end
