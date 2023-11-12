import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/core/models/failure.dart';
import 'package:riverpod_example/core/providers/base_state_notifier.dart';
import 'package:riverpod_example/features/animals/repositories/animals_repository.dart';
import 'package:riverpod_example/features/animals/repositories/remote_animal_repository.dart';

final animalsStateNotifierProvider =
    StateNotifierProvider<AnimalsStateNotifierProvider, AsyncValue<String>?>(
  (ref) => AnimalsStateNotifierProvider(
    ref.watch(remoteAnimalsRepositoryProvider),
  ),
);

class AnimalsStateNotifierProvider extends BaseStateNotifier<String> {
  AnimalsStateNotifierProvider(this._animalsRepository);

  final AnimalsRepository _animalsRepository;

  Future<void> getRandomDogImage() async {
    setLoadingState();
    final Either<Failure, String> response =
        await _animalsRepository.getRandomDogImage();
    response.fold(
      (Failure failure) => setErrorState(failure.message),
      (String image) => setLoadedState(image),
    );
  }
}
