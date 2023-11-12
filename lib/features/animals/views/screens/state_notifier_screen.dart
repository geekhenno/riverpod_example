import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/core/widgets/async_value_view.dart';
import 'package:riverpod_example/features/animals/providers/animals_state_notifer_provider.dart';

class StateNotifierScreen extends ConsumerStatefulWidget {
  const StateNotifierScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StateNotifierScreen> createState() =>
      _StateNotifierScreenState();
}

class _StateNotifierScreenState extends ConsumerState<StateNotifierScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchData,
          ),
        ],
      ),
      body: AsyncValueView<String>(
        state: ref.watch(animalsStateNotifierProvider),
        builder: (String data) {
          return Image.network(data);
        },
      ),
    );
  }

  void _fetchData() =>
      ref.read(animalsStateNotifierProvider.notifier).getRandomDogImage();
}
