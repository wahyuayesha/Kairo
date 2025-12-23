import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/domain/repositories/localRepository.dart';

class GetPredictedUsecase {
 final LocalRepository repository;

  GetPredictedUsecase(this.repository);

  Future<Either<Failure, List<TrashEntity>>> call() {
    return repository.getAllPredictedTrash();
  }
}
