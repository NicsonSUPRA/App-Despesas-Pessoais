import 'package:flutter/material.dart';
import 'package:lista_tarefas/components/chartBar.dart';
import 'package:lista_tarefas/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (Transaction tr in recentTransactions) {
        if (tr.time.day == weekDay.day &&
            tr.time.month == weekDay.month &&
            tr.time.year == weekDay.year) {
          totalSum += tr.value;
        }
      }
      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    }).reversed.toList();
  }

  List<Transaction> get _rescentTransactions {
    return recentTransactions.where((element) {
      return element.time.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  double get totalValueWeek {
    return groupedTransaction.fold(0.0, (previousValue, tr) {
      return previousValue += (tr['value']) as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransaction.map((tr) {
              // return Text(' ${tr['day']} : ${tr['value']} ');
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: tr['day'].toString(),
                    value: double.parse(tr['value'].toString()),
                    percentage: totalValueWeek == 0.0
                        ? 0.0
                        : double.parse(tr['value'].toString()) /
                            totalValueWeek),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
