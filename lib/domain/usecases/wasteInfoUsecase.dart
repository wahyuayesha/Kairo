import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/domain/entities/wasteInfoEntity.dart';
import 'package:kairo/domain/repositories/wasteInfoRepository.dart';

class Wasteinfousecase {
  final Wasteinforepository repository;
  Wasteinfousecase(this.repository);
  
  Future<Either<Failure, List<Wasteinfoentity>>> call() {
    return repository.getWasteInfo();
  }
}