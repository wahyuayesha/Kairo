import 'package:kairo/domain/entities/trashEntity.dart';

class TrashModel {
  List<String> className;
  List<String> confidence;
  String image;

  TrashModel({
    required this.className,
    required this.confidence,
    required this.image,
  });

  static TrashModel fromJson(json) {
    return TrashModel(
      className: json['classes']['class_name'],
      confidence: json['classes']['confidence'],
      image: json['image'],
    );
  }

  static toEntity(TrashModel model) {
    return TrashEntity(
      className: model.className,
      image: model.image,
    );
  }
}
