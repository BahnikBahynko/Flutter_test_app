import 'package:flutter/material.dart';
import 'package:app_test/models/coin.api.dart';
import 'package:app_test/models/coin.dart';
import 'package:app_test/views/widgets/coin_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Coin> _coins;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCoins();
  }

  Future<void> getCoins() async {
    _coins = await CoinsApi.getCoin("/coins");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.monetization_on),
              SizedBox(width: 10),
              Text('Coins scope')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _coins.length,
                itemBuilder: (context, index) {
                  return CoinCard(
                      id: _coins[index].id.toString(),
                      symbol: _coins[index].symbol,
                      name: _coins[index].name,
                      iconUrl: _coins[index].iconUrl,
                      price: _coins[index].price);
                },
              )
    );
  }
}