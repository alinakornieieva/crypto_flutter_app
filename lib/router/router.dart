import 'package:crypto_flutter_app/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_flutter_app/features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Crypto App'),
  '/coin': (context) => const CryptoCoinScreen()
};
