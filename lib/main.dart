import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color dark = Color.fromARGB(255, 21, 21, 21);
const Color white = Color.fromARGB(255, 255, 255, 255);
const Color primary = Color.fromARGB(255, 243, 167, 68);

const TextTheme appTextTheme = TextTheme(
  bodyMedium: TextStyle(
    color: white,
    fontWeight: FontWeight.w300,
    fontSize: 15,
  ),
  bodyLarge: TextStyle(
    color: white,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  ),
);

const DividerThemeData appDividerTheme = DividerThemeData(
  color: Color.fromARGB(255, 48, 48, 48),
  thickness: 1,
  space: 10,
  indent: 10,
  endIndent: 10,
);

const ListTileThemeData appListTileTheme = ListTileThemeData(iconColor: white);

const AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: dark,
  foregroundColor: white,
  titleTextStyle: TextStyle(
    color: white,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  ),
  centerTitle: true,
  iconTheme: IconThemeData(color: white),
);

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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: dark,
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        appBarTheme: appBarTheme,
        textTheme: appTextTheme,
        dividerTheme: appDividerTheme,
        listTileTheme: appListTileTheme,
        useMaterial3: true,
      ),
      routes: {
        '/list': (context) => const CryptoListScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
      initialRoute: '/list',
    );
  }
}

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
