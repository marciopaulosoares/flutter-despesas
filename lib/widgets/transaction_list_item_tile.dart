import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionListItemTile extends StatelessWidget {

  final Transaction tx;
  final Function removeTransationFN;

  TransactionListItemTile(this.tx, this.removeTransationFN);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        horizontal: 8, 
        vertical: 5
      ),
          child: ListTile(
        leading: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Theme.of(context).primaryColor,
            shape:BoxShape.rectangle,
            
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${tx.amount}') ,
            ),
          ),
        ),
        title: Text(tx.title, style: Theme.of(context).textTheme.headline6,),
        subtitle: Text(DateFormat.yMMMMd().format(tx.date)),
        trailing: IconButton(
                              icon: Icon(Icons.delete_forever), 
                              color: Theme.of(context).errorColor,
                              onPressed: () => removeTransationFN(tx.id),
                            ),
      ),
    );
  }
}