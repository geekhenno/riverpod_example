import 'package:dartz/dartz.dart';
import 'package:riverpod_example/core/models/failure.dart';

abstract class AnimalsRepository {
  Future<Either<Failure, String>> getRandomDogImage();
}
