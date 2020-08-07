import 'package:flutter/material.dart';
import 'package:flutter_despesas/widgets/transaction_list_item_tile.dart';
import './transaction_empty.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> userTransactions;
  final Function removeTransationFN;

  TransactionList({this.userTransactions, this.removeTransationFN});

  @override
  Widget build(BuildContext context) {
    return 
          userTransactions.isEmpty 
                          ? TransactionEmpty()
                          : ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: userTransactions.length,
                                            itemBuilder: (ctx, index){
                                              return TransactionListItemTile(userTransactions[index],removeTransationFN);
                                            });
  }
}