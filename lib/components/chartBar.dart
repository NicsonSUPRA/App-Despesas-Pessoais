import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar(
      {super.key,
      required this.label,
      required this.value,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
                height: constraints.maxHeight * 0.15,
                child:
                    FittedBox(child: Text('R\$${value.toStringAsFixed(2)}'))),
            SizedBox(
              height: 5,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(220, 220, 220, 1)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 189, 107, 203),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(label)
          ],
        );
      },
    );
  }
}
