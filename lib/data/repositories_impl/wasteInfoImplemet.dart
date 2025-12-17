import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/data/datasources/wasteInfoDatasource.dart';
import 'package:kairo/data/models/wasteInfoModel.dart';
import 'package:kairo/domain/entities/wasteInfoEntity.dart';
import 'package:kairo/domain/repositories/wasteInfoRepository.dart';

class Wasteinfoimplemet implements Wasteinforepository {
  final Wasteinfodatasource datasource;
  Wasteinfoimplemet(this.datasource);

  @override
  Future<Either<Failure, List<Wasteinfoentity>>> getWasteInfo() async {
    try {
      final List<WasteInfoModel> wasteInfoList = await datasource
          .fetchWasteInfo();

      // Konversi dari Model ke Entity
      final List<Wasteinfoentity> wasteInfoEntityList = wasteInfoList
          .map((e) => WasteInfoModel.toEntity(e))
          .toList();
      return Right(wasteInfoEntityList);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
