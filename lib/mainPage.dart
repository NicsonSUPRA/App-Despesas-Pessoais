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
//parou na aula 143

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

  bool _showChat = false;

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  final List<Transaction> _transactions = [
    Transaction(
        id: "1",
        title: "Fazer compras",
        value: 200.34,
        time: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: "2",
        title: "Novo tênis",
        value: 100.00,
        time: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: "3",
        title: "Coca cola",
        value: 10.00,
        time: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: "4",
        title: "Lanche no Shopping",
        value: 60.50,
        time: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: "5",
        title: "Parcela Casa",
        value: 1200.50,
        time: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
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
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    double avaliableHeightChart = !isLandScape ? 0.3 : 0.7;

    final appBar = AppBar(
      title: Text(
        "Controle de Despesas",
        style: TextStyle(
            fontSize: 10 * MediaQuery.of(context).textScaler.scale(1.5)),
        //TextScalerFactor foi depreciado
      ),
      actions: [
        if (isLandScape)
          IconButton(
              onPressed: () => setState(() {
                    _showChat = !_showChat;
                  }),
              icon: Icon(_showChat ? Icons.list : Icons.show_chart)),
        IconButton(
            onPressed: () => _openTransactionForm(context),
            icon: Icon(Icons.add))
      ],
      centerTitle: true,
      backgroundColor: Colors.purple[100],
    );
    final avaliableHeight =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;

    return Scaffold(
        appBar: appBar,
        floatingActionButton: IconButton.filled(
            onPressed: () => _openTransactionForm(context),
            icon: Icon(Icons.add)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_showChat || !isLandScape)
                Container(
                    height: avaliableHeight * avaliableHeightChart,
                    child: Chart(recentTransactions: _transactions)),
              if (!_showChat || !isLandScape)
                Column(
                  children: [
                    Container(
                      height: avaliableHeight * (isLandScape ? 0.8 : 0.6),
                      child: TransactionList(
                          transactions: _transactions,
                          remove: _removeTransaction),
                    ),
                  ],
                )
            ],
          ),
        ));
  }
}
