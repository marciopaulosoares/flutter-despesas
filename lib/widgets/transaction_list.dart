import 'package:flutter/material.dart';
import 'package:flutter_despesas/widgets/transaction_list_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> userTransactions;
  TransactionList({this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index){
                return TransactionListItem(userTransactions[index]);
              }),
          );
  }
}