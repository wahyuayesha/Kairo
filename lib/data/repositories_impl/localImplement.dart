import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/data/datasources/localDatasource.dart';
import 'package:kairo/data/models/trashModel.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/domain/repositories/localRepository.dart';

class Localimplement implements LocalRepository {
  final LocalDatasource datasource;

  Localimplement(this.datasource);

  // helper tanggal: YYYY-M-D (tanpa nol di depan)
  String _today() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  @override
  Future<Either<Failure, TrashEntity>> savePrediction(
    TrashEntity entity,
  ) async {
    try {
      // set tanggal di repository impl
      final entityWithDate = entity.copyWith(
        createdAt: _today(),
      );

      // entity -> model
      final model = TrashModel.fromEntity(entityWithDate);

      // simpan ke datasource
      final savedModel = await datasource.savePrediction(model);

      // model -> entity
      final resultEntity = TrashModel.toEntity(savedModel);

      return Right(resultEntity);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrashEntity>>> getAllPredictedTrash() async {
    try {
      final models = await datasource.getAllPredictions();

      final entities =
          models.map((e) => TrashModel.toEntity(e)).toList();

      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
