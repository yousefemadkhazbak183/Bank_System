import 'bank_account.dart';

class SavingsBankAccount extends BankAccount {
  late double minimumBalance;

  SavingsBankAccount(double balance) : super(balance) {
    minimumBalance = 1000;
  }

  @override
  bool withdraw(double amountOfMoney) {
    // TODO: implement withdraw
    if (balance - amountOfMoney < minimumBalance) {
      print('Sorry, balance must be > minBalance');
      return false;
    }
    return super.withdraw(amountOfMoney);
  }

  @override
  bool deposit(double amountOfMoney) {
    // TODO: implement deposit
    if (amountOfMoney < 100) {
      print('Sorry, amount of money must be >= 100 ');
      return false;
    }
    return super.deposit(amountOfMoney);
  }

  @override
  void view() {
    super.view();
    print('MinimumBalance: $minimumBalance');
  }
}
