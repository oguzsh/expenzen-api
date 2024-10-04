class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.decimal :balance
      t.string :account_type

      t.timestamps
    end
  end
end
