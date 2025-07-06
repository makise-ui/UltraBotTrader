class Trade {
  final String symbol;
  final String type;
  final double price;
  final double quantity;
  final DateTime timestamp;

  Trade({
    required this.symbol,
    required this.type,
    required this.price,
    required this.quantity,
    required this.timestamp,
  });

  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      symbol: json['symbol'],
      type: json['type'],
      price: json['price'].toDouble(),
      quantity: json['quantity'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type,
      'price': price,
      'quantity': quantity,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
