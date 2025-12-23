import 'package:get/get.dart';
import 'package:kairo/core/services/database_service.dart';
import 'package:kairo/data/datasources/imageDatasource.dart';
import 'package:kairo/data/datasources/localDatasource.dart';
import 'package:kairo/data/datasources/predictDatasource.dart';
import 'package:kairo/data/datasources/wasteInfoDatasource.dart';
import 'package:kairo/data/repositories_impl/imageImplement.dart';
import 'package:kairo/data/repositories_impl/localImplement.dart';
import 'package:kairo/data/repositories_impl/predictImplement.dart';
import 'package:kairo/data/repositories_impl/wasteInfoImplemet.dart';
import 'package:kairo/domain/repositories/imageRepository.dart';
import 'package:kairo/domain/repositories/localRepository.dart';
import 'package:kairo/domain/repositories/predictRepository.dart';
import 'package:kairo/domain/repositories/wasteInfoRepository.dart';
import 'package:kairo/domain/usecases/getPredictedUsecase.dart';
import 'package:kairo/domain/usecases/predictImageUsecase.dart';
import 'package:kairo/domain/usecases/wasteInfoUsecase.dart';
import 'package:kairo/view/controllers/predictControler.dart';
import 'package:kairo/view/controllers/wasteInfoController.dart';

void initDependencies() {
  Get.put(DatabaseService(), permanent: true);

  // DATA SOURCES
  Get.lazyPut(() => ImageDatasource(), fenix: true);
  Get.lazyPut(() => Predictdatasource(), fenix: true);
  Get.lazyPut(() => Wasteinfodatasource(), fenix: true);
  Get.lazyPut(() => Predictdatasource(), fenix: true);
  Get.lazyPut(() => LocalDatasource(databaseService: Get.find()), fenix: true);

  // REPOSITORIES
  Get.lazyPut<ImageRepository>(() => ImageImplement(Get.find()), fenix: true);
  Get.lazyPut<Predictrepository>(
    () => Predictimplement(Get.find(), Get.find()),
    fenix: true,
  );
  Get.lazyPut<Wasteinforepository>(
    () => Wasteinfoimplemet(Get.find()),
    fenix: true,
  );
  Get.lazyPut<LocalRepository>(() => Localimplement(Get.find()), fenix: true);

  // USE CASES
  Get.lazyPut(
    () => Predictimageusecase(
      imageRepository: Get.find(),
      predictrepository: Get.find(),
      localRepository: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(() => Wasteinfousecase(Get.find()), fenix: true);

  Get.lazyPut(() => GetPredictedUsecase(Get.find()), fenix: true);
  
  // CONTROLLERS
  Get.lazyPut(
    () => Predictcontroler(
      predictImageUsecase: Get.find(),
      getPredictedUsecase: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => Wasteinfocontroller(wasteInfoUsecase: Get.find()),
    fenix: true,
  );
}
