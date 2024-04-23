import 'package:crypto_flutter_app/repositories/crypto_coins/models/crypto_coin.dart';

abstract class AbstractCryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
