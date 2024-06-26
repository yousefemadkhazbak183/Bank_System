import 'bank_account.dart';

class Client {
  String name;
  String address;
  String phoneNumber;
  late BankAccount account;

  /// [required] is Named Mandatory.
  Client(
      {required this.name, required this.address, required this.phoneNumber});
}
