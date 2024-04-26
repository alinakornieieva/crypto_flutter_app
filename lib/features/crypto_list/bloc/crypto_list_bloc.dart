import 'package:crypto_flutter_app/repositories/crypto_coins/abstract_crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/crypto_coins/models/models.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        final cryptoList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(cryptoList: cryptoList));
      } catch (e) {
        emit(CryptoListLoadingFailed(exception: e));
      }
    });
  }

  final AbstractCryptoCoinsRepository coinsRepository;
}
