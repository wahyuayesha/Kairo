import 'package:get/get.dart';
import 'package:kairo/domain/entities/wasteInfoEntity.dart';
import 'package:kairo/domain/usecases/wasteInfoUsecase.dart';

class Wasteinfocontroller extends GetxController{
  final Wasteinfousecase wasteInfoUsecase;
  Wasteinfocontroller({required this.wasteInfoUsecase});

  RxList<Wasteinfoentity> wasteInfoList = <Wasteinfoentity>[].obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  Future<void> fetchWasteInfo() async {
    isLoading.value = true;
    error.value = '';
    final result = await wasteInfoUsecase();
    result.fold(
      (failure) {
        error.value = failure.message.toString();
        print('🚩 ERROR: ${error.value.toString()}');
      },
      (wasteInfo) {
        wasteInfoList.value = wasteInfo;
        print('✅ Waste Info fetched: ${wasteInfoList.length} items');
      },
    );
    isLoading.value = false;
  }

  Wasteinfoentity? getWasteInfoByName(String className) {
    try {
      return wasteInfoList.firstWhere((info) => info.className.toLowerCase() == className.toLowerCase());
    } catch (e) {
      print('⚠️ Waste info not found for name: $className');
      return null;
    }
  }
}