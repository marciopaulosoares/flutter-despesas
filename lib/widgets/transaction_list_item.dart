import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction tx;
  TransactionListItem(this.tx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor)),
              padding: EdgeInsets.all(15),
              child: Text(
                'R\$ ${tx.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tx.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(DateFormat.yMd('pt').format(tx.date)),
            ],
          )
        ],
      ),
    );
  }
}
