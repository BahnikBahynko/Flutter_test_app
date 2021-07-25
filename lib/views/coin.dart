import 'package:flutter/material.dart';
import 'package:app_test/models/coin.api.dart';
import 'package:app_test/models/market.history.dart';
import 'package:app_test/views/widgets/coin_scope.dart';
import 'dart:developer';

class CoinPage extends StatefulWidget {
  final String id;
  final String name;
  final String time;
  CoinPage({
    @required required this.id,
    @required required this.name,
    @required required this.time,
  });
  @override
  _CoinPageState createState() => _CoinPageState(id: id, name: name, time: time);
}

class _CoinPageState extends State<CoinPage> {
  final String id;
  final String name;
  final String time;
  _CoinPageState({
    @required required this.id,
    @required required this.name,
    @required required this.time,
  });
  late List<MarketHistory> _coins;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCoins();
  }

  Future<void> getCoins() async {
    _coins = await MarketHistoryApi.getCoinHistory("/coin/$id/history/$time");
    log('$_coins');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.monetization_on),
              SizedBox(width: 10),
              Text(name),

            ],
          ),
          bottom: PreferredSize(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                TextButton(
                  child: const Text('24 hours'),
                  onPressed: () {
                    Navigator.pop(context, '24h');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoinPage(id: id, name: name, time: '24h')));
                  },),
                TextButton(
                  child: const Text('7 days'),
                  onPressed: () {
                    Navigator.pop(context, '7d');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoinPage(id: id, name: name, time: '7d')));
                  },),
                TextButton(
                  child: const Text('30 days'),
                  onPressed: () {
                    Navigator.pop(context, '30d');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoinPage(id: id, name: name, time: '30d')));
                  },),
                TextButton(
                  child: const Text('1 year'),
                  onPressed: () {
                    Navigator.pop(context, '1y');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoinPage(id: id, name: name, time: '1y')));
                  },),
                TextButton(
                  child: const Text('5 years'),
                  onPressed: () {
                    Navigator.pop(context, '5y');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoinPage(id: id, name: name, time: '5y')));
                  },)
              ],),
              color: Colors.white,
              height: 20.0,
            ),
            preferredSize: Size.fromHeight(20.0),
          )
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            :
              ListView.builder(
                itemCount: _coins.length,
                itemBuilder: (context, index) {
                  return CoinScope(
                      price: _coins[index].price,
                      timestamp: _coins[index].timestamp.toString()
                  );
                },
              ),
    );
  }
}
            
