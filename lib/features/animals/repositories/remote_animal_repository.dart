import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/core/models/failure.dart';
import 'package:riverpod_example/features/animals/repositories/animals_repository.dart';

final remoteAnimalsRepositoryProvider =
    Provider((ref) => RemoteAnimalsRepository());

class RemoteAnimalsRepository extends AnimalsRepository {
  final Dio _dio = Dio();
  @override
  Future<Either<Failure, String>> getRandomDogImage() async {
    try {
      final response =
          await _dio.get('https://dog.ceo/api/breeds/image/random');
      final String image = response.data['message'];
      return Right(image);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
