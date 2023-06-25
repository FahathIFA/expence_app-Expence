class Transaction {
  final String title;
  final String id;
  final double amount;
  final DateTime dateTime;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateTime,
  });
}
