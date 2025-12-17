import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/domain/entities/wasteInfoEntity.dart';

abstract class Wasteinforepository {
  Future<Either<Failure, List<Wasteinfoentity>>> getWasteInfo();
}
