import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modals/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTx,
  });

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _bgColor,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(widget.transaction.dateTime),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  'delete',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                onPressed: () => widget.deleteTx(widget.transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => widget.deleteTx(widget.transaction.id),
              ),
      ),
    );
  }
}
