import 'package:get/get.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/domain/usecases/predictImageUsecase.dart';

class Predictcontroler extends GetxController {
  final Predictimageusecase predictImageUsecase;

  Predictcontroler({required this.predictImageUsecase});

  Rx<TrashEntity> predictedTrash = TrashEntity(className: [''], image: '').obs;
  RxList<TrashEntity> predictedTrashes = <TrashEntity>[].obs;

  RxBool isloading = false.obs;
  RxString error = ''.obs;

  Future<void> predictImage(bool fromGallery) async {
    isloading.value = true;
    final result = await predictImageUsecase(fromGallery);
    result.fold(
      (failure) {
        error.value = failure.toString();
        print('🚩 ERROR: ${error.value.toString()}');
      },
      (predicted) {
        predictedTrash.value = predicted;
      },
    );
    print('🗑️ CLASSES: ${predictedTrash.value.className}');
    isloading.value = false;
  }
}
