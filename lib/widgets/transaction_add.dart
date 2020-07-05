import 'package:flutter/material.dart';

class TransactionAdd extends StatelessWidget {

  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionAdd(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
            
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    // onChanged: (value) => {
                    //   //titleInput = value
                    // },
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController
                      // onChanged: (value) {
                      //   // amountInput = value;
                      // }
                  ,),
                  FlatButton(
                      onPressed: (){
                         print(titleController.text);
                         print(amountController.text);
                         addTx(titleController.text, double.parse(amountController.text));
                      }, 
                      child: Text('Add Transaction'), 
                      textColor: Colors.orange,
                  )
                ],
              ),
            ),
          );
  }
}