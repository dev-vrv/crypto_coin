import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? wallet;
  int? balance;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    wallet = args['wallet'];
    balance = args['balance'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(wallet as String),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/png/CRYPTO.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Text(
              'Wallet Balance: $balance',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        )));
  }
}
