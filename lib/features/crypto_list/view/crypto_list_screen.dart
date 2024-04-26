import 'package:crypto_flutter_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_flutter_app/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_flutter_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc =
      CryptoListBloc(GetIt.I<AbstractCryptoCoinsRepository>());

  @override
  void initState() {
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
        body: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                  itemCount: state.cryptoList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.cryptoList[i];
                    return CryptoListTile(coin: coin);
                  });
            }
            if (state is CryptoListLoadingFailed) {
              return Center(
                  child: Text('Something went wrong',
                      style: theme.textTheme.bodyLarge));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
