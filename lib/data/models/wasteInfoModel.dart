import 'package:kairo/domain/entities/wasteInfoEntity.dart';

class WasteInfoModel {
  final int id;
  final String className;
  final String category;
  final String definition;
  final List<String> managements;
  final List<String> collectionSites;
  final List<String> recycles;

  WasteInfoModel({
    required this.id,
    required this.className,
    required this.category,
    required this.definition,
    required this.managements,
    required this.collectionSites,
    required this.recycles,
  });

  static WasteInfoModel fromJson(Map<String, dynamic> json) {
    return WasteInfoModel(
      id: json['id'],
      className: json['class'],
      category: json['category'],
      definition: json['definition'],
      managements: List<String>.from(json['managements']),
      collectionSites: List<String>.from(json['collection_sites']),
      recycles: List<String>.from(json['recycles']),
    );
  }

  static Wasteinfoentity toEntity(WasteInfoModel model) {
    return Wasteinfoentity(
      id: model.id,
      className: model.className,
      category: model.category,
      definition: model.definition,
      managements: model.managements,
      collectionSites: model.collectionSites,
      recycles: model.recycles,
    );
  }
}
