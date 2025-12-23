import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/domain/repositories/imageRepository.dart';
import 'package:kairo/domain/repositories/localRepository.dart';
import 'package:kairo/domain/repositories/predictRepository.dart';

class Predictimageusecase {
  final ImageRepository imageRepository;
  final Predictrepository predictrepository;
  final LocalRepository localRepository;

  Predictimageusecase({
    required this.imageRepository,
    required this.predictrepository,
    required this.localRepository,
  });

  Future<Either<Failure, TrashEntity>> call(bool fromGallery) async {
    final image = await imageRepository.pickImage(
      fromGallery,
    ); // Pick or capture image
    return image.fold(
      (failure) => Left(failure), // Handle error
      (file) async {
        // Predict image
        final prediction = await predictrepository.predict(file);
        return prediction.fold(
          (failure) => Left(failure), // Handle prediction error
          (trashEntity) async {
            // Save prediction locally
            final savedPrediction = await localRepository.savePrediction(
              trashEntity,
            );
            return savedPrediction.fold(
              (failure) => Left(failure), // Handle saving error
              (savedTrash) => Right(savedTrash), // Return saved prediction
            );
          },
        );
      },
    );
  }
}
