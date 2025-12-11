import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';

abstract class ImageRepository {
  Future<Either<Failure, File>> pickImage(bool fromGallery);
}


