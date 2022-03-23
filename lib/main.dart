import 'package:expense_planner/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: 'Weekly Groceries',
      amount: 15.59,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses Planner'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                    color: Colors.blue,
                    child: Text(
                      'CHART',
                      textAlign: TextAlign.center,
                    )),
              ),
              Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ...transactions.map((transaction) {
                        return Card(
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '\$${transaction.amount}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.purple),
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transaction.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateFormat.yMMMd().format(transaction.date),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
