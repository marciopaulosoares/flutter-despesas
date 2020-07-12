import 'package:flutter/material.dart';

class TransactionAdd extends StatefulWidget {
  final Function addTx;

  TransactionAdd(this.addTx);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final _title = titleController.text;
    final _amount = double.parse(amountController.text);

    if (_title.isEmpty || _amount <= 0) {
      return;
    }

    print(_title);
    print(_amount);
    widget.addTx(_title, _amount);

    Navigator.of(context).pop();
  }

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
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
