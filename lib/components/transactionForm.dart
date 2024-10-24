import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  DateTime? selectedDate = null;

  _submitForm() {
    final String title = titleController.text;
    final double value = double.parse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0.0) {
      return;
    }

    widget.onSubmit(title, value, selectedDate!);
  }

  _showDatePicker(BuildContext ctx) {
    showDatePicker(
            context: ctx, firstDate: DateTime(2019), lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Título"),
              ),
              TextField(
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: "Valor"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(selectedDate == null
                        ? "Nenhuma data foi selecionada!"
                        : DateFormat('d/MM/y').format(selectedDate!)),
                    FilledButton(
                      onPressed: () => _showDatePicker(context),
                      child: Text("selecionar data"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                          onPressed: _submitForm, child: Text("Salvar")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
