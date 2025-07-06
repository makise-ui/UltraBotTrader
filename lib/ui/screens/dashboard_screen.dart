import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_bot_app/services/trading_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trading Bot Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TradingService>(
              builder: (context, tradingService, child) {
                return Text('Bot Status: ${tradingService.status}');
              },
            ),
            const SizedBox(height: 20),
            Consumer<TradingService>(
              builder: (context, tradingService, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (tradingService.status == 'Idle') {
                      tradingService.startTrading();
                    } else {
                      tradingService.stopTrading();
                    }
                  },
                  child: Text(tradingService.status == 'Idle' ? 'Start Trading' : 'Stop Trading'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}