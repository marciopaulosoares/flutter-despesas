import 'package:flutter/material.dart';

class TransactionEmpty extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
                'No transactions added yet!',
                style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox( height: 20,),
          Container(
            height: 100,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)
          ),
    ],),
    );
  }
}