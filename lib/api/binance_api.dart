import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trading_bot_app/api/base_api.dart';
import 'package:trading_bot_app/utils/secure_storage.dart';

class BinanceApi extends BaseApi {
  final String _baseUrl = "https://api.binance.com";
  final SecureStorage _secureStorage = SecureStorage();

  String? _apiKey;
  String? _apiSecret;

  BinanceApi() {
    _loadApiKeys();
  }

  Future<void> _loadApiKeys() async {
    _apiKey = await _secureStorage.readSecureData('binance_api_key');
    _apiSecret = await _secureStorage.readSecureData('binance_api_secret');
  }

  Future<void> saveApiKeys(String apiKey, String apiSecret) async {
    await _secureStorage.writeSecureData('binance_api_key', apiKey);
    await _secureStorage.writeSecureData('binance_api_secret', apiSecret);
    _apiKey = apiKey;
    _apiSecret = apiSecret;
  }

  @override
  Future<dynamic> getAccountInfo() async {
    // This is a placeholder. Real implementation would involve signing requests.
    if (_apiKey == null || _apiSecret == null) {
      throw Exception('API keys not set.');
    }
    final response = await http.get(Uri.parse('$_baseUrl/api/v3/account'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load account info: ${response.body}');
    }
  }

  @override
  Future<dynamic> placeOrder({
    required String symbol,
    required String side,
    required String type,
    required double quantity,
    double? price,
  }) async {
    // This is a placeholder. Real implementation would involve signing requests.
    if (_apiKey == null || _apiSecret == null) {
      throw Exception('API keys not set.');
    }
    final response = await http.post(
      Uri.parse('$_baseUrl/api/v3/order'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'symbol': symbol,
        'side': side,
        'type': type,
        'quantity': quantity,
        'price': price,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to place order: ${response.body}');
    }
  }

  @override
  Future<dynamic> getMarketData(String symbol) async {
    final response = await http.get(Uri.parse('$_baseUrl/api/v3/ticker/price?symbol=$symbol'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get market data: ${response.body}');
    }
  }
}
