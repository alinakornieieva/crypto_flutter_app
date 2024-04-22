import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(color: Colors.grey, fontSize: 18)),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 158, 58),
            background: Colors.black),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'Crypto App'),
        '/coin': (context) => const CryptoCoinScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.separated(
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
            }));
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log('You must provide args!');
      return;
    }
    if (args is! String) {
      log('You must provide String args!');
      return;
    }
    coinName = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: theme.colorScheme.inversePrimary,
          title: const Text('Bitcoin')),
      body: const Text(
        'ghjk',
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
