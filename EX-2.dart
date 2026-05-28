class BankAccount {
  final int ID;
  String accountOwner;
  double balance;

  BankAccount({required this.ID, required this.owner, this.balance});

  void credit(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Please input credit that is greater than 0");
    }

    balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Please withdraw the money");
    } else if (balance - amount < 0) {
      throw Exception("Cannot withdraw due to the lack of money");
    }

    balance -= amount;
  }
}

class Bank {
  String name;
  List<BankAccount> accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int id, String owner) {
    // dont know what tto do
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount davidAccount = myBank.createAccount(100, 'David');

  print(davidAccount.balance);
  davidAccount.credit(100);
  print(davidAccount.balance);
  davidAccount.withdraw(50);
  print(davidAccount.balance);

  try {
    davidAccount.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(100, 'David');
  } catch (e) {
    print(e);
  }
}
