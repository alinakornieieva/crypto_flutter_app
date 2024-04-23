import 'package:crypto_flutter_app/repositories/crypto_coin/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.image, width: 45),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: Text(
        '${coin.priceUSD.toStringAsFixed(2)}\$',
        style: theme.textTheme.bodySmall,
      ),
      trailing: const Icon(Icons.arrow_right_alt),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin.name);
      },
    );
  }
}
