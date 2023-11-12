import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/core/widgets/async_value_view.dart';
import 'package:riverpod_example/features/animals/providers/animals_future_provider.dart';

class FutureProviderScreen extends ConsumerStatefulWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FutureProviderScreen> createState() =>
      _FutureProviderScreenState();
}

class _FutureProviderScreenState extends ConsumerState<FutureProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(animalsFutureProvider);
            },
          ),
        ],
      ),
      body: Center(
        child: AsyncValueView(
          state: ref.watch(animalsFutureProvider),
          builder: (String data) {
            return Image.network(data);
          },
        ),
      ),
    );
  }
}
