import 'package:get/get.dart';
import 'package:kairo/data/datasources/imageDatasource.dart';
import 'package:kairo/data/datasources/predictDatasource.dart';
import 'package:kairo/data/repositories_impl/imageImplement.dart';
import 'package:kairo/data/repositories_impl/predictImplement.dart';
import 'package:kairo/domain/repositories/imageRepository.dart';
import 'package:kairo/domain/repositories/predictRepository.dart';
import 'package:kairo/domain/usecases/predictImageUsecase.dart';
import 'package:kairo/view/controllers/predictControler.dart';

void initDependencies() {
  Get.lazyPut(() => ImageDatasource());
  Get.lazyPut(() => Predictdatasource());
  Get.lazyPut<ImageRepository>(() => ImageImplement(Get.find()), fenix: true);
  Get.lazyPut<Predictrepository>(() => Predictimplement(Get.find()), fenix: true);
  Get.lazyPut(() => Predictimageusecase(
    imageRepository: Get.find(),
    predictrepository: Get.find(),
  ));
  Get.lazyPut(() => Predictcontroler(predictImageUsecase: Get.find()));
}
