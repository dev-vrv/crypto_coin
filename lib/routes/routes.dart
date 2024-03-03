import '../components/crypto_coin_screen/crypto_coin_screen.dart';
import '../components/crypto_list_screen/crypto_list_screen.dart';

final routes = {
  '/list': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
};

const initialRoute = '/list';
