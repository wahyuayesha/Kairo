import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/data/datasources/localDatasource.dart';
import 'package:kairo/data/datasources/predictDatasource.dart';
import 'package:kairo/data/models/trashModel.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/domain/repositories/predictRepository.dart';

class Predictimplement implements Predictrepository {
  final Predictdatasource datasource;
  final LocalDatasource localDatasource;
  Predictimplement(this.datasource, this.localDatasource);

  @override
  Future<Either<Failure, TrashEntity>> predict(File image) async {
    try {
      final TrashModel? trashPredicted = await datasource.predict(image);
      if (trashPredicted == null) {
        return Left(ServerFailure('Predicted data not found'));
      }

      // final TrashModel newPredictedModel = await localDatasource.savePrediction(
      //   trashPredicted,
      // );

      final TrashEntity trashPredictedEntity = TrashModel.toEntity(
        trashPredicted,
      );
      final TrashEntity trashEntity = trashPredictedEntity.copyWith(
        className: trashPredicted.className.toSet().toList(),

      );
      return Right(trashEntity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
