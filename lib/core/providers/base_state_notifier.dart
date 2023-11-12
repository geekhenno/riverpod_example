import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseStateNotifier<T extends Object>
    extends StateNotifier<AsyncValue<T>?> {
  BaseStateNotifier([AsyncValue<T>? initial]) : super(initial);

  void setErrorState(String message) {
    debugPrint(message);
    state = AsyncError(message, StackTrace.current);
  }

  void setLoadingState() {
    state = const AsyncLoading();
  }

  void setLoadedState(T data) {
    state = AsyncData(data);
  }
}
