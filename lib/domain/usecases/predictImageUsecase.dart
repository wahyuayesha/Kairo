import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/domain/repositories/imageRepository.dart';
import 'package:kairo/domain/repositories/predictRepository.dart';

class Predictimageusecase {
  final ImageRepository imageRepository;
  final Predictrepository predictrepository;

  Predictimageusecase({
    required this.imageRepository,
    required this.predictrepository,
  });

  Future<Either<Failure, TrashEntity>> call(bool fromGallery) async {
    final image = await imageRepository.pickImage(
      fromGallery,
    ); // Pick or capture image
    return image.fold(
      (failure) => Left(failure), // Handle error
      (file) async => await predictrepository.predict(
        file,
      ), // Predict trash classes on image
    );
  }
}
