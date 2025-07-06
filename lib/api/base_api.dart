// Base API class for common functionalities
abstract class BaseApi {
  Future<dynamic> getAccountInfo();
  Future<dynamic> placeOrder({
    required String symbol,
    required String side,
    required String type,
    required double quantity,
    double? price,
  });
  Future<dynamic> getMarketData(String symbol);
}
