import 'package:crypto_flutter_app/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_flutter_app/repositories/crypto_coin/crypto_coin_repository.dart';
import 'package:crypto_flutter_app/repositories/crypto_coin/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  @override
  void initState() {
    loadCryptoCoinsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: (_cryptoCoinList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _cryptoCoinList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinList![i];
                return CryptoListTile(coin: coin);
              }),
    );
  }

  Future<void> loadCryptoCoinsList() async {
    _cryptoCoinList = await CryptoCoinRepository().getCoinsList();
    setState(() {});
  }
}
