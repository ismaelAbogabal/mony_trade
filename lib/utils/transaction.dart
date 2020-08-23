enum transactionState { Deposit, Withdraw }

class Transaction {
  transactionState state;
  double amount;
  bool done;
  DateTime date;

  Transaction({this.state, this.amount, this.done, this.date});

  get stateString => state.toString().split(".").last;
}
