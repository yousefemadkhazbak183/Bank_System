import 'client.dart';

class BankAccount {
  static int ids_Generator = 1000;
  late int accountId;
  late double balance;
  late Client client;

  BankAccount([this.balance = 1000]){
    accountId = ids_Generator;
    ids_Generator++;
  }

  bool withdraw(double amountOfMoney){
    if(amountOfMoney < 0){
      print('Sorry, amount of maoney must be > 0');
      return false;
    }
    if(amountOfMoney > balance){
      print('Sorry, balance not sufficient');
      return false;
    }
    balance -= amountOfMoney;
    print('Amount of money withdrawn successfully, and ur balance is $balance ');
    return true;
  }

  bool deposit(double amountOfMoney){
    if(amountOfMoney < 0){
      print('Sorry, amount of money must be > 0');
      return false;
    }
    if(amountOfMoney < 100){
      print('Sorry, amount of money must be >= 100');
      return false;
    }
    balance += amountOfMoney;
    print('Amount of money deposit successfully, and ur balance is $balance');
    return true;
  }

  void view(){
    print('AccountId: $accountId');
    print('Balance: $balance');
    print('Client Name: ${client.name}');
    print('Client Address: ${client.address}');
    print('Client PhoneNumber: ${client.phoneNumber}');
  }
}