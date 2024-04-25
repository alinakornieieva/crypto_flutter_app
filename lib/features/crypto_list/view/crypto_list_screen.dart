import 'package:crypto_flutter_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_flutter_app/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_flutter_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  final _cryptoListBloc = CryptoListBloc();

  @override
  void initState() {
    loadCryptoCoinsList();
    _cryptoListBloc.add(LoadCryptoList());
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
    _cryptoCoinList =
        await GetIt.I<AbstractCryptoCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
