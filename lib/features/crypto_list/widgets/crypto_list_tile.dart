import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          const coinName = 'Bicoin';
          return ListTile(
            leading: Image.asset('assets/bitcoin_logo.png', width: 35),
            title: Text(
              coinName,
              style: theme.textTheme.bodyLarge,
            ),
            subtitle: Text(
              '70 000\$',
              style: theme.textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.arrow_right_alt),
            onTap: () {
              Navigator.of(context).pushNamed('/coin', arguments: coinName);
            },
          );
        });
  }
}
