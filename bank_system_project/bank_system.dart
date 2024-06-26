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
    //testData();
  }

  void testData() {
    for (int i = 0; i < 100; i++) {
      BankAccount account = BankAccount(i * 1000);
      Client client =
          Client(name: "Client $i", address: "Cairo $i", phoneNumber: "111");

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

  int getAccountIndexById(int accountId) {
    for (int i = 0; i < allAccounts.length; i++) {
      if (allAccounts[i].accountId == accountId) {
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
    print('=================');
  }

  BankAccount? getBankAccount(int accountId) {
    for (int i = 0; i < allAccounts.length; i++) {
      if (allAccounts[i].accountId == accountId) {
        return allAccounts[i];
      }
    }
    return null;
  }

  void searchAccount() {
    print('please, Enter account id: ');
    int accountId = int.parse(stdin.readLineSync()!);

    int index = getAccountIndexById(accountId);
    if (index < 0) {
      print('sorry, account not found');
      return;
    } else {
      print('Found Account');
      allAccounts[index].view();
    }
  }

  void delete() {
    print('Please, enter accountID: ');
    int accountId = int.parse(stdin.readLineSync()!);
    BankAccount? account = getBankAccount(accountId);

    if (account == null) {
      print('account not founded');
    } else {
      allAccounts.remove(account);
      print('account deleted successfully');
    }
  }

  void withdraw() {
    print('Please, Enter account id: ');
    int accountID = int.parse(stdin.readLineSync()!);

    BankAccount? bankAccount = getBankAccount(accountID);
    if (bankAccount == null) {
      print('Account not found');
      return;
    } else {
      print('Please, Enter amount of money: ');
      double amountOfMoney = double.parse(stdin.readLineSync()!);
      bankAccount.withdraw(amountOfMoney);
    }
  }

  void updateAccount() {
    print('please, Enter account id: ');
    int accountId = int.parse(stdin.readLineSync()!);

    int index = getAccountIndexById(accountId);
    if (index < 0) {
      print('Account not fond');
      return;
    } else {
      print('1- Update name: ');
      print('2- Update address: ');
      print('3- Update PhoneNumber: ');
      print('4- Update Balance: ');
      int usrOptional = int.parse(stdin.readLineSync()!);

      if (usrOptional == 1) {
        print('Please, Enter your Name: ');
        String name = stdin.readLineSync()!;
        allAccounts[index].client.name = name;
      } else if (usrOptional == 2) {
        print('Please, Enter your address: ');
        String address = stdin.readLineSync()!;
        allAccounts[index].client.address = address;
      } else if (usrOptional == 3) {
        print('Please, Enter your PhoneNumber: ');
        String phoneNumber = stdin.readLineSync()!;
        allAccounts[index].client.phoneNumber = phoneNumber;
      } else if (usrOptional == 4) {
        print('please, Enter Your Balance: ');
        double balance = double.parse(stdin.readLineSync()!);
        allAccounts[index].balance = balance;
      }
    }
    print('Data update Successfully');
  }

  void createAccount() {
    print('Please, Enter balance: ');
    double balance = double.parse(stdin.readLineSync()!);

    print('Please, Enter Client name: ');
    String name = stdin.readLineSync()!;

    print('Please, Enter Clint address: ');
    String address = stdin.readLineSync()!;

    print('Please, Enter Client Phone number: ');
    String phoneNumber = stdin.readLineSync()!;

    BankAccount bankAccount;
    Client client =
        Client(name: name, address: address, phoneNumber: phoneNumber);
    print('1- to Basics bank account');
    print('2- to Savings bank account');

    int userOptional = int.parse(stdin.readLineSync()!);
    if (userOptional == 1) {
      bankAccount = BankAccount(balance);
      bankAccount.client = client;
      client.account = bankAccount;
    } else if (userOptional == 2) {
      bankAccount = SavingsBankAccount(balance);
      bankAccount.client = client;
      client.account = bankAccount;
    } else {
      print('Invalid option!');
      return;
    }
    allAccounts.add(bankAccount);
    allClients.add(client);
    print('Account has been created successfully');
  }

  void deposit() {
    print('Please, Enter account id: ');
    int accountID = int.parse(stdin.readLineSync()!);

    BankAccount? bankAccount = getBankAccount(accountID);
    if (bankAccount == null) {
      print('Account not found');
      return;
    } else {
      print('Please, Enter amount of money: ');
      double amountOfMoney = double.parse(stdin.readLineSync()!);
      bankAccount.deposit(amountOfMoney);
    }
  }

  void showMenu() {
    while (true) {
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

      if (userOptional == 1) {
        // Create Account.
        createAccount();
      } else if (userOptional == 2) {
        // Show all Available Accounts
        showAvailableAccounts();
      } else if (userOptional == 3) {
        // Show all details for specific accounts.
        viewDetailsAccount();
      } else if (userOptional == 4) {
        // Search for Account.
        searchAccount();
      } else if (userOptional == 5) {
        // Update for specific accounts.
        updateAccount();
      } else if (userOptional == 6) {
        // Withdraw money for account.
        withdraw();
      } else if (userOptional == 7) {
        // Deposit money from specific account.
        deposit();
      } else if (userOptional == 8) {
        // Delete Account.
        delete();
      } else if (userOptional == 9) {
        // Exit.
        return;
      } else {
        print('Invalid Option.');
        showMenu();
      }
    }
  }
}

void main() {
  BankSystem bankSystem = BankSystem();
  bankSystem.showMenu();
}
