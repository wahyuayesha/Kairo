import 'package:get/get.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/domain/usecases/getPredictedUsecase.dart';
import 'package:kairo/domain/usecases/predictImageUsecase.dart';

class Predictcontroler extends GetxController {
  final Predictimageusecase predictImageUsecase;
  final GetPredictedUsecase getPredictedUsecase;

  Predictcontroler({
    required this.predictImageUsecase,
    required this.getPredictedUsecase,
  });

  Rx<TrashEntity> predictedTrash = TrashEntity(className: [''], image: '').obs;
  RxList<TrashEntity> predictedTrashes = <TrashEntity>[].obs;

  RxBool isloading = false.obs;
  RxString error = ''.obs;

  Future<void> predictImage(bool fromGallery) async {
    isloading.value = true;
    error.value = '';
    final result = await predictImageUsecase(fromGallery);
    result.fold(
      (failure) {
        error.value = failure.toString();
        print('🚩 ERROR: ${error.value.toString()}');
      },
      (predicted) async {
        predictedTrash.value = predicted;
        await fetchAllPredictedTrash();
      },
    );
    print('🗑️ CLASSES: ${predictedTrash.value.className}');
    isloading.value = false;
  }

  Future<void> fetchAllPredictedTrash() async {
    isloading.value = true;
    error.value = '';
    final result = await getPredictedUsecase();
    result.fold(
      (failure) {
        error.value = failure.toString();
        print('🚩 ERROR: ${error.value.toString()}');
      },
      (predictedList) {
        predictedTrashes.value = predictedList;
        print(
          '🗑️ FETCHED PREDICTED TRASHES: ${predictedTrashes.length} TRASHES',
        );
      },
    );
    isloading.value = false;
  }
}
