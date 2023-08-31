import 'package:flutter/material.dart';

import './transaction.dart';

import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: PersonalExpensesHomePage(),
    );
  }
}

class PersonalExpensesHomePage extends StatelessWidget {
  PersonalExpensesHomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Car', amount: 1600, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'New Scooter', amount: 239.99, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'New Laptop', amount: 999.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Chart'),
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  ElevatedButton (
                    child: Text('Add Transaction'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
                child: Row(children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  '\$${transaction.amount}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transaction.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transaction.date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ])
            ]));
          }).toList())
        ],
      ),
    );
  }
}
