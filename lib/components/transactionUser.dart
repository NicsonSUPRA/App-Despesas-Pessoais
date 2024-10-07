// import 'dart:math';

// import 'package:flutter/material.dart';
// import '../models/transaction.dart';
// import '../components/transactionList.dart';
// import '../components/transactionForm.dart';

// class TransactionUser extends StatefulWidget {
//   TransactionUser({super.key});

//   @override
//   State<TransactionUser> createState() => _TransactionUserState();
// }

// class _TransactionUserState extends State<TransactionUser> {
//   final _transactions = [
//     new Transaction(
//         id: "1", title: "Fazer compras", value: 200.34, time: DateTime.now()),
//     new Transaction(
//         id: "2", title: "Novo tênis", value: 100.00, time: DateTime.now()),
//     new Transaction(
//         id: "3", title: "Coca cola", value: 10.00, time: DateTime.now()),
//     new Transaction(
//         id: "4",
//         title: "Lanche no Shopping",
//         value: 30.50,
//         time: DateTime.now())
//   ];

//   _addTransaction(String title, double value) {
//     Transaction newTransaction = new Transaction(
//         id: Random().nextDouble().toString(),
//         title: title,
//         value: value,
//         time: DateTime.now());
//     setState(() {
//       _transactions.add(newTransaction);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TransactionForm(
//           onSubmit: _addTransaction,
//         ),
//         TransactionList(transactions: _transactions),
//       ],
//     );
//   }
// }
