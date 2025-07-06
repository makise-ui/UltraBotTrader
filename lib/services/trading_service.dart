import 'package:flutter/foundation.dart';

class TradingService extends ChangeNotifier {
  // This service will handle the trading logic, strategy execution, etc.
  // For now, it's a placeholder.

  String _status = 'Idle';
  String get status => _status;

  void startTrading() {
    _status = 'Trading...';
    notifyListeners();
    // Implement actual trading logic here
  }

  void stopTrading() {
    _status = 'Idle';
    notifyListeners();
    // Implement stopping trading logic here
  }
}
