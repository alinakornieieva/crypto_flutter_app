import 'package:crypto_flutter_app/repositories/crypto_coin/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final image = usdData['IMAGEURL'];
      return CryptoCoin(
          name: e.key,
          priceUSD: price,
          image: 'https://www.cryptocompare.com/$image');
    }).toList();
    return cryptoCoinList;
  }
}
