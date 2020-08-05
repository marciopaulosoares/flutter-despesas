import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;

        for(var i = 0; i < recentTransactions.length; i ++){
            var _transaction = recentTransactions[i];
            if(_transaction.date.day == weekDay.day &&
               _transaction.date.month == weekDay.month &&
               _transaction.date.year == weekDay.year
               )
            {
                totalSum += _transaction.amount;
            }
        }
         return {'day':DateFormat.E().format(weekDay).substring(0,1), 'amount':totalSum};
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum, item){
        return sum + item['amount'];
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 6, 
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactionValues.map((data){

                  var percent = (data['amount'] as double) / totalSpending;
                  if(percent.isNaN){
                    percent = 0;
                  }

                  return Flexible(
                        fit: FlexFit.tight,
                        child: ChartBar(data['day'],data['amount'],percent)
                      ); 
              }).toList()
            ),
          ),
    );
  }
}