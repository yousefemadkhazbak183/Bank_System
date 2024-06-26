 import 'dart:io';
import 'savings_bank_account.dart';
import 'bank_account.dart';
import 'client.dart';

class BankSystem {
  late List<BankAccount> allAccounts;
  late List<Client> allClients;

  BankSystem() {
    allAccounts = [];
    allClients = [];
    testData();
  }

  void testData() {
    for (int i = 0; i < 100; i++) {
      BankAccount account = BankAccount(i * 1000);
      Client client = Client(
          name: "Client $i", address: "Cairo $i", phoneNumber: "111");

      account.client = client;
      client.account = account;

      allAccounts.add(account);
      allClients.add(client);
    }
  }

  void showAvailableAccounts() {
    for (int i = 0; i < allAccounts.length; i++) {
      allAccounts[i].view();
      print('=====================');
    }
  }


  int getAccountIndexById(int accountId){
    for(int i = 0; i < allAccounts.length; i++){
      if(allAccounts[i].accountId == accountId){
        return i;
      }
    }
    return -1;
  }


  void viewDetailsAccount() {
    print('Please, Enter account id: ');
    int accountId = int.parse(stdin.readLineSync()!);
    int index = getAccountIndexById(accountId);
    if (index < 0) {
      print('Sorry, not found');
    } else {
      allAccounts[index].view();
    }
  }

  BankAccount? getBankAccount(int accountId){
    for(int i = 0; i < allAccounts.length; i++){
      if(allAccounts[i].accountId == accountId){
        return allAccounts[i];
      }
    }
    return null;
  }

    void delete(){
      print('Please, enter accountID: ' );
      int accountId = int.parse(stdin.readLineSync()!);
      BankAccount? account = getBankAccount(accountId);

      if (account == null) {
        print('account not founded');
      } else {
        allAccounts.remove(account);
        print('account deleted successfully');
      }
    }


    void withdraw(){
    print('Please, Enter account id: ');
    int accountID = int.parse(stdin.readLineSync()!);

    BankAccount? bankAccount = getBankAccount(accountID);
    if(bankAccount == null){
      print('Account not found');
      return;
    }else{
      print('Please, Enter amount of money: ');
      double amountOfMoney = double.parse(stdin.readLineSync()!);
      bankAccount.withdraw(amountOfMoney);
    }
    }

    void deposit(){
      print('Please, Enter account id: ');
      int accountID = int.parse(stdin.readLineSync()!);

      BankAccount? bankAccount = getBankAccount(accountID);
      if(bankAccount == null){
        print('Account not found');
        return;
      }
      else {
        print('Please, Enter amount of money: ');
        double amountOfMoney = double.parse(stdin.readLineSync()!);
        bankAccount.deposit(amountOfMoney);
      }
    }


  void showMenu(){
    while(true){
      print('1- Create Account.');
      print('2- Show all available accounts.');
      print('3- Show details for specific accounts.');
      print('4- Search for account.');
      print('5- Update for specific account.');
      print('6- Withdraw money from specific account.');
      print('7- Deposit money from specific account.');
      print('8- Delete Account.');
      print('9- Exit.');

      int userOptional = int.parse(stdin.readLineSync()!);

      if(userOptional == 1){
        // Create Account.

      }else if(userOptional == 2){
        // Show all Available Accounts
        showAvailableAccounts();
      }else if(userOptional == 3){
        // Show all details for specific accounts.
        viewDetailsAccount();
      }else if(userOptional == 4){
        // Search for Account.

      }else if(userOptional == 5){
        // Update for specific accounts.

      }else if(userOptional == 6){
        // Withdraw money for account.
        withdraw();
      }else if(userOptional == 7){
        // Deposit money from specific account.
        deposit();
      }else if(userOptional == 8){
        // Delete Account.
        delete();
      }else if(userOptional == 9){
        // Exit.
        return;
      }else{
        print('Invalid Option.');
        showMenu();
      }
    }
  }
 }


 void main(){
  BankSystem bankSystem = BankSystem();
  bankSystem.showMenu();
 }