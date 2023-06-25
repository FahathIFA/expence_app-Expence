import 'package:expence_app/modals/transaction.dart';
import 'package:expence_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTx,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  "No, transactions added yet!!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    "assets/image/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionItem(
                key: ValueKey(transactions[index].id),
                transaction: transactions[index],
                deleteTx: deleteTx,
              );
            },
          );
    // : ListView(
    //     children: transactions.map((tx) {
    //     return TransactionItem(
    //       key: UniqueKey(),
    //       transaction: tx,
    //       deleteTx: deleteTx,
    //     );
    //   }).toList());
  }
}
