import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/domain/entities/trashEntity.dart';

abstract class Predictrepository {
  Future<Either<Failure, TrashEntity>> predict(File image);
}
