import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueView<T> extends ConsumerWidget {
  final AsyncValue<T>? state;
  final Widget Function(T data) builder;
  const AsyncValueView({
    super.key,
    required this.state,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // That's mean initial state
    if (state == null) return const SizedBox.shrink();
    return state!.when(
      data: (T data) {
        if (data is List && data.isEmpty) {
          return const SizedBox.shrink();
        }
        return builder(data);
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.purple,
        ),
      ),
      skipLoadingOnRefresh: false,
    );
  }
}
