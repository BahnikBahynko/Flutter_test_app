class Coin {
  final int id;
  final String symbol;
  final String name;
  final String iconUrl;
  final String price;

  Coin({required this.id, required this.symbol, required this.name, required this.iconUrl, required this.price});

  factory Coin.fromJson(dynamic json) {
    return Coin(
        id: json['id'] as int,
        symbol: json['symbol'] as String,
        name: json['name'] as String,
        iconUrl: json['iconUrl'] as String,
        price: json['price'] as String);
  }

  static List<Coin> coinsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Coin.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Data {id: $id, symbol: $symbol, name: $name, inonUrl: $iconUrl, price: $price}';
  }

  static String changeData(String iconUrl){
    final temp = iconUrl.replaceAll(".svg", ".png"); 
    return temp;
  }
}