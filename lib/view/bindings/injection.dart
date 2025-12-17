import 'package:get/get.dart';
import 'package:kairo/data/datasources/imageDatasource.dart';
import 'package:kairo/data/datasources/predictDatasource.dart';
import 'package:kairo/data/datasources/wasteInfoDatasource.dart';
import 'package:kairo/data/repositories_impl/imageImplement.dart';
import 'package:kairo/data/repositories_impl/predictImplement.dart';
import 'package:kairo/data/repositories_impl/wasteInfoImplemet.dart';
import 'package:kairo/domain/repositories/imageRepository.dart';
import 'package:kairo/domain/repositories/predictRepository.dart';
import 'package:kairo/domain/repositories/wasteInfoRepository.dart';
import 'package:kairo/domain/usecases/predictImageUsecase.dart';
import 'package:kairo/domain/usecases/wasteInfoUsecase.dart';
import 'package:kairo/view/controllers/predictControler.dart';
import 'package:kairo/view/controllers/wasteInfoController.dart';

void initDependencies() {
  // DATA SOURCES
  Get.lazyPut(() => ImageDatasource());
  Get.lazyPut(() => Predictdatasource());
  Get.lazyPut(() => Wasteinfodatasource());

  // REPOSITORIES
  Get.lazyPut<ImageRepository>(() => ImageImplement(Get.find()), fenix: true);
  Get.lazyPut<Predictrepository>(
    () => Predictimplement(Get.find()),
    fenix: true,
  );
  Get.lazyPut<Wasteinforepository>(
    () => Wasteinfoimplemet(Get.find()),
    fenix: true,
  );

  // USE CASES
  Get.lazyPut(
    () => Predictimageusecase(
      imageRepository: Get.find(),
      predictrepository: Get.find(),
    ),
  );
  Get.lazyPut(() => Wasteinfousecase(Get.find()));

  // CONTROLLERS
  Get.lazyPut(() => Predictcontroler(predictImageUsecase: Get.find()));
  Get.lazyPut(()=> Wasteinfocontroller(wasteInfoUsecase: Get.find()));
}
