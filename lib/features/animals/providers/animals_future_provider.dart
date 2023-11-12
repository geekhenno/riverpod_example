import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/core/models/failure.dart';
import 'package:riverpod_example/features/animals/repositories/animals_repository.dart';
import 'package:riverpod_example/features/animals/repositories/remote_animal_repository.dart';

final animalsFutureProvider = FutureProvider((ref) async {
  ref.onResume(() {
    if (ref.state.hasError) {
      ref.invalidateSelf();
    }
  });

  final AnimalsRepository animalsRepository =
      ref.watch(remoteAnimalsRepositoryProvider);
  final Either<Failure, String> response =
      await animalsRepository.getRandomDogImage();
  return response.fold(
    (Failure failure) => throw failure.message,
    (String image) => image,
  );
});
