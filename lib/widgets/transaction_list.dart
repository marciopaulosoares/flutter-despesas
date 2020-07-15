import 'package:flutter/material.dart';
import './transaction_empty.dart';
import './transaction_list_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> userTransactions;
  TransactionList({this.userTransactions});

  

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            height: 300,
            child: userTransactions.isEmpty 
                          ? TransactionEmpty()
                          : ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: userTransactions.length,
                                            itemBuilder: (ctx, index){
                                              return TransactionListItem(userTransactions[index]);
                                            }),
          );
  }
}