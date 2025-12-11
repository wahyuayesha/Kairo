import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/data/datasources/imageDatasource.dart';
import 'package:kairo/domain/repositories/imageRepository.dart';

class ImageImplement implements ImageRepository {
  final ImageDatasource datasource;
  ImageImplement(this.datasource);

  @override
  Future<Either<Failure, File>> pickImage(bool fromGallery) async {
    try {
      final File? image = await datasource.pickImage(fromGallery);

      if (image == null) {
        return Left(CacheFailure('No image selected or captured'));
      }

      return Right(image);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
