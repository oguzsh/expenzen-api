require 'faker'

# Clear existing data
User.destroy_all
Account.destroy_all
Category.destroy_all
Transaction.destroy_all
RecurringTransaction.destroy_all

puts "Creating users..."
user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
user2 = User.create(name: 'Jane Smith', email: 'jane@example.com', password: 'password123')

puts "Creating accounts..."
checking_account = Account.create(user: user1, name: 'Checking Account', balance: 5000.0, account_type: 'checking')
savings_account = Account.create(user: user1, name: 'Savings Account', balance: 10000.0, account_type: 'savings')

credit_card = Account.create(user: user2, name: 'Credit Card', balance: -1000.0, account_type: 'credit_card')
business_account = Account.create(user: user2, name: 'Business Account', balance: 15000.0, account_type: 'checking')

puts "Creating categories..."
food_category = Category.create(user: user1, name: 'Groceries', category_type: 'expense')
salary_category = Category.create(user: user1, name: 'Salary', category_type: 'income')
rent_category = Category.create(user: user2, name: 'Rent', category_type: 'expense')
freelance_income = Category.create(user: user2, name: 'Freelance Work', category_type: 'income')

puts "Creating transactions..."
transaction1 = Transaction.create(
  user: user1,
  account: checking_account,
  category: food_category,
  amount: -50.0,
  transaction_type: 'expense',
  description: 'Grocery shopping',
  date: Date.today - 2,
  is_recurring: true
)

transaction2 = Transaction.create(
  user: user1,
  account: checking_account,
  category: salary_category,
  amount: 2000.0,
  transaction_type: 'income',
  description: 'Salary Payment',
  date: Date.today - 15,
  is_recurring: true
)

transaction3 = Transaction.create(
  user: user2,
  account: credit_card,
  category: rent_category,
  amount: -1000.0,
  transaction_type: 'expense',
  description: 'Rent for October',
  date: Date.today,
  is_recurring: true
)

transaction4 = Transaction.create(
  user: user2,
  account: business_account,
  category: freelance_income,
  amount: 3000.0,
  transaction_type: 'income',
  description: 'Freelance project payment',
  date: Date.today - 7,
  is_recurring: false
)

# Create Recurring Transactions
puts "Creating recurring transactions..."
RecurringTransaction.create(
  transaction_id: transaction1,
  user: user1,
  recurrence_pattern: 'monthly',
  recurrence_interval: 1,
  start_date: Date.today - 30,
  last_occurrence: Date.today - 30,
  end_date: Date.today + 6.months
)

RecurringTransaction.create(
  financial_transaction: transaction3,
  user: user2,
  recurrence_pattern: 'monthly',
  recurrence_interval: 1,
  start_date: Date.today - 30,
  last_occurrence: Date.today - 30,
  end_date: Date.today + 1.year
)

puts "Seeding complete!"
