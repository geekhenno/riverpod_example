import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/core/extensions/provider_extension.dart';
import 'package:riverpod_example/features/animals/providers/animals_state_notifer_provider.dart';

class StateNotifierWithListenerScreen extends ConsumerStatefulWidget {
  const StateNotifierWithListenerScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StateNotifierWithListenerScreen> createState() =>
      _StateNotifierWithListenerScreenState();
}

class _StateNotifierWithListenerScreenState
    extends ConsumerState<StateNotifierWithListenerScreen> {
  @override
  Widget build(BuildContext context) {
    ref.customListen(
      context: context,
      provider: animalsStateNotifierProvider,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier With Listener'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchData,
          ),
        ],
      ),
    );
  }

  void _fetchData() =>
      ref.read(animalsStateNotifierProvider.notifier).getRandomDogImage();
}
