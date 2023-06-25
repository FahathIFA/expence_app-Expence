import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expence_app/widgets/adaptive_text_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxc;
  const NewTransaction(this.addTxc, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTxc(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 20,
            right: 20,
            bottom: mediaQuery.viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                controller: _amountController,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date chosen!'
                            : 'Picked Date: ${DateFormat.yMMMEd().format(_selectedDate!)}',
                      ),
                    ),
                    AdaptiveTextButton(
                      title: 'choose date',
                      handler: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text("Add Transaction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
