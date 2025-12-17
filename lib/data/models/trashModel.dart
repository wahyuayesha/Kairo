import 'package:kairo/domain/entities/trashEntity.dart';

class TrashModel {
  int? id;
  List<String> className;
  List<double> confidence;
  String image;

  TrashModel({
    this.id,
    required this.className,
    required this.confidence,
    required this.image,
  });

  static TrashModel fromJson(Map<String, dynamic> json) {
    final classes = json['classes'] as List;
  
    return TrashModel(
      id: null,
      className: classes.map((e) => e['class_name'] as String).toList(),
      confidence: classes
          .map((e) => (e['confidence'] as num).toDouble())
          .toList(),
      image: json['image'],
    );
  }

  static TrashEntity toEntity(TrashModel model) {
    return TrashEntity(
      className: model.className, // list of string
      image: model.image,
    );
  }
}
