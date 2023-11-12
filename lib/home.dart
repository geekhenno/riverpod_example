import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_example/features/animals/views/screens/future_provider_screen.dart';
import 'package:riverpod_example/features/animals/views/screens/state_notifier_screen.dart';
import 'package:riverpod_example/features/animals/views/screens/state_notifier_with_listener_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Demo'),
      ),
      body: ListView(
        children: [
          CupertinoButton(
            child: const Text('Future Provider Example'),
            onPressed: () {
              _navigateToNextScreen(const FutureProviderScreen());
            },
          ),
          CupertinoButton(
            child: const Text('State Notifier Provider Example'),
            onPressed: () {
              _navigateToNextScreen(const StateNotifierScreen());
            },
          ),
          CupertinoButton(
            child: const Text('State Notifier Provider with Listener Example'),
            onPressed: () {
              _navigateToNextScreen(const StateNotifierWithListenerScreen());
            },
          ),
        ],
      ),
    );
  }

  void _navigateToNextScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
