abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * interestRate;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

void main() {
  // Creating a SavingsAccount instance
  var savings = SavingsAccount(12345, 1000.0, 0.05);
  print('Savings Account:');
  savings.deposit(500.0);
  savings.withdraw(200.0);
  savings.withdraw(1500.0);

  // Creating a CurrentAccount instance
  var current = CurrentAccount(67890, 2000.0, 500.0);
  print('Current Account:');
  current.deposit(1000.0);
  current.withdraw(2500.0);
  current.withdraw(1500.0);
}
