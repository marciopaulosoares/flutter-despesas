import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_add.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransactions = [
    Transaction(id: '01', title: 'comida', amount: 56.89, date: DateTime.now()),
    Transaction(id: '02', title: 'tenis', amount: 20.89, date: DateTime.now()),
    Transaction(id: '03', title: 'remedio', amount: 10.89, date: DateTime.now()),
    Transaction(id: '04', title: 'despesas', amount: 19.89, date: DateTime.now())
  ];

  void _addNewTransaction(String p_title, double p_amount){
    final newTx = Transaction(title: p_title, amount: p_amount, date: DateTime.now(), id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionAdd(_addNewTransaction),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}