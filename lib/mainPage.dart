import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista_tarefas/components/chart.dart';
import 'package:lista_tarefas/components/transactionForm.dart';
import 'package:lista_tarefas/components/transactionList.dart';
import 'package:lista_tarefas/components/transactionUser.dart';
import 'package:lista_tarefas/models/transaction.dart';
import 'package:intl/intl.dart';

//parou na aula 88
//parou na aula 101
//pacou na aula 109
//parou na aula 120
//parou na aula 126
//parou na aula 134

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _addTransaction(String title, double value, DateTime time) {
    Transaction newTransaction = new Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        time: time);
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  final List<Transaction> _transactions = [
    new Transaction(
        id: "1",
        title: "Fazer compras",
        value: 200.34,
        time: DateTime.now().subtract(Duration(days: 4))),
    new Transaction(
        id: "2",
        title: "Novo tênis",
        value: 100.00,
        time: DateTime.now().subtract(Duration(days: 3))),
    new Transaction(
        id: "3",
        title: "Coca cola",
        value: 10.00,
        time: DateTime.now().subtract(Duration(days: 1))),
    new Transaction(
        id: "4",
        title: "Lanche no Shopping",
        value: 60.50,
        time: DateTime.now().subtract(Duration(days: 2))),
    new Transaction(
        id: "5",
        title: "Parcela Casa",
        value: 1200.50,
        time: DateTime.now().subtract(Duration(days: 4))),
    new Transaction(
        id: "6",
        title: "Presente",
        value: 300.80,
        time: DateTime.now().subtract(Duration(days: 3)))
  ];

  _openTransactionForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Controle de Despesas"),
          actions: [
            IconButton(
                onPressed: () => _openTransactionForm(context),
                icon: Icon(Icons.add))
          ],
          centerTitle: true,
          backgroundColor: Colors.purple[100],
        ),
        floatingActionButton: IconButton.filled(
            onPressed: () => _openTransactionForm(context),
            icon: Icon(Icons.add)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(recentTransactions: _transactions),
              Column(
                children: [
                  TransactionList(
                      transactions: _transactions, remove: _removeTransaction),
                ],
              )
            ],
          ),
        ));
  }
}
