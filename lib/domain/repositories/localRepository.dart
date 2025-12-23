import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/domain/entities/trashEntity.dart';

abstract class LocalRepository {
  Future<Either<Failure, TrashEntity>> savePrediction(TrashEntity trash);
  Future<Either<Failure, List<TrashEntity>>> getAllPredictedTrash();
}