import 'package:flutter/material.dart';

const List<String> walletNames = [
  'Bitcoin',
  'Ethereum',
  'Ripple',
  'Litecoin',
  'Cardano',
  'Polkadot',
  'Bitcoin Cash',
  'Chainlink',
  'Stellar',
  'USD Coin',
  'Tether',
  'Dogecoin',
  'Binance Coin',
  'Monero',
  'Tron',
  'EOS',
  'NEM',
];

const Map<String, int> walletBalance = {
  'Bitcoin': 10,
  'Ethereum': 20,
  'Ripple': 30,
  'Litecoin': 40,
  'Cardano': 40,
  'Polkadot': 50,
  'Bitcoin Cash': 60,
  'Chainlink': 22,
  'Stellar': 10,
  'USD Coin': 20,
  'Tether': 0,
  'Dogecoin': 0,
  'Binance Coin': 0,
  'Monero': 0,
  'Tron': 0,
  'EOS': 0,
  'NEM': 0,
};

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final textMedium = Theme.of(context).textTheme.bodyMedium;
    final textLarge = Theme.of(context).textTheme.bodyLarge;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Wallets'),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(
                'assets/png/CRYPTO.png',
                height: 50,
                width: 50,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                '${walletNames[index]} Wallet',
                style: textLarge,
              ),
              subtitle: Text(
                'Balance: ${walletBalance[walletNames[index]]}',
                style: textMedium,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/coin', arguments: {
                  'wallet': walletNames[index],
                  'balance': walletBalance[walletNames[index]],
                });
              },
            );
          },
          itemCount: walletNames.length),
    );
  }
}
