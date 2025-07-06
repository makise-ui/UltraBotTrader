import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_bot_app/ui/screens/dashboard_screen.dart';
import 'package:trading_bot_app/ui/screens/settings_screen.dart';
import 'package:trading_bot_app/services/trading_service.dart';
import 'package:trading_bot_app/services/background_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService(); // Initialize background service
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TradingService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading Bot App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}