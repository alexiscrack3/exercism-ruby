module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      -3.213
    elsif balance >= 0 && balance < 1000
      0.5
    elsif balance >= 1000 && balance < 5000
      1.621
    elsif balance >= 5000
      2.475
    end
  end

  def self.annual_balance_update(balance)
    adjusted_interest_rate = balance * SavingsAccount.interest_rate(balance) / 100
    if balance.positive?
      balance + adjusted_interest_rate
    else
      balance - adjusted_interest_rate
    end
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    minimum_number_of_years = 0
    updated_balance = current_balance
    loop do
      updated_balance = SavingsAccount.annual_balance_update(updated_balance)
      minimum_number_of_years += 1
      break if updated_balance > desired_balance
    end
    minimum_number_of_years
  end
end
