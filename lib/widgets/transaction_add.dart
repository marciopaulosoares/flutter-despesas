import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionAdd extends StatefulWidget {
  final Function addTx;

  TransactionAdd(this.addTx);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {

    if(amountController.text.isEmpty){
      return;
    }

    final _title = titleController.text;
    final _amount = double.parse(amountController.text);

    if (_title.isEmpty || _amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(_title, _amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void presentDatePicker(){
    var currentYear = DateTime.now().year;
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(currentYear), lastDate: DateTime.now())
    .then((selected) {
      if(selected == null){
        return;
      }
      setState(() {
         _selectedDate = selected;
      });
     
    });
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(child: Text(_selectedDate == null ? 'Choose a date' : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}')),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Select a date', style: TextStyle(fontWeight: FontWeight.bold),), 
                    onPressed: presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.white,
              color: Colors.orange[300],
            )
          ],
        ),
      ),
    );
  }
}
