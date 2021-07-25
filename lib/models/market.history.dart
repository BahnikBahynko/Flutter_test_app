class MarketHistory {
  final String price;
  final String timestamp;

  MarketHistory({required this.price, required this.timestamp});

  factory MarketHistory.fromJson(dynamic json) {
    return MarketHistory(
        price: json['price'] as String,
        timestamp: json['timestamp'] as String);
  }

  static List<MarketHistory> coinsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return MarketHistory.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Data {price: $price, timestamp: $timestamp}';
  }

  static String changeSecToDate(int timestamp){
    final date = new DateTime.fromMillisecondsSinceEpoch(timestamp)
      .toString()
      .replaceAll(":00.000", "");
    return date;
  }
}