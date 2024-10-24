import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final void Function(String) remove;

  const TransactionList(
      {super.key, required this.transactions, required this.remove});

  @override
  Widget build(BuildContext context) {
    return !transactions.isEmpty
        ? ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final Transaction tr = transactions[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('R\$${tr.value.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(DateFormat('d MMM y').format(tr.time)),
                  trailing: IconButton(
                    onPressed: () => remove(tr.id),
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
            },
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: constraints.maxHeight * 0.12,
                      child: Text("Nenhuma transação foi cadastrada")),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    padding: EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          );
  }
}
