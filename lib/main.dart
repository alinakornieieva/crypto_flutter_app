import 'package:crypto_flutter_app/crypto_app.dart';
import 'package:crypto_flutter_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCryptoCoinsRepository>(
      () => CryptoCoinRepository(dio: Dio()));
  runApp(const CryptoApp());
}
