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
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(color: Colors.grey, fontSize: 18)),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 158, 58),
            background: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Crypto App'),
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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
                  leading: Image.asset('assets/bitcoin_logo.png', width: 35),
                  title: Text(
                    'Bitcoin',
                    style: theme.textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    '70 000\$',
                    style: theme.textTheme.bodySmall,
                  ),
                )));
  }
}
