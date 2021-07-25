import 'dart:convert';
import 'package:app_test/models/coin.dart';
import 'package:app_test/models/market.history.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class Credentials {
  static getCredentials(uri) async {
      final response = await http.get(uri,  headers: {
      'x-rapidapi-key': 'a0c5de161cmshd6def8083576368p126333jsne4c5b43455e6',
      'x-rapidapi-host': 'coinranking1.p.rapidapi.com',
      'useQueryString': 'true'
    });
  return response;
  }
}

class CoinsApi {
  static Future<List<Coin>> getCoin(route) async {
    var uri = Uri.https('coinranking1.p.rapidapi.com', route);
    final response = await Credentials.getCredentials(uri);
    
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['data']['coins']) {
      //log(i['iconUrl']);
      //little outplay .svg
      i['iconUrl'] = Coin.changeData(i['iconUrl']);
      _temp.add(i);
    }
    return Coin.coinsFromSnapshot(_temp);
  }
}


class MarketHistoryApi {
  static Future<List<MarketHistory>> getCoinHistory(route) async {
    var uri = Uri.https('coinranking1.p.rapidapi.com', route);
    final response = await Credentials.getCredentials(uri);
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['data']['history']) {
      i['timestamp'] = MarketHistory.changeSecToDate(i['timestamp']);
      _temp.add(i);
    }

    return MarketHistory.coinsFromSnapshot(_temp);
  }
}