import 'dart:convert';

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

  // dari API prediksi
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

  // dari database sqflite
  static TrashModel fromDatabase(Map<String, dynamic> json) {
    return TrashModel(
      id: json['id'] as int?,
      className: List<String>.from(jsonDecode(json['class_name'] as String)),
      confidence: List<double>.from(jsonDecode(json['confidence'] as String)),
      image: json['image'] as String,
    );
  }

  // ke database sqflite
  Map<String, dynamic> toDatabase() {
    return {
      'id': id,
      'class_name': jsonEncode(className), // List<String> → String
      'confidence': jsonEncode(confidence), // List<double> → String
      'image': image,
    };
  }

  // ke bentuk Entity
  static TrashEntity toEntity(TrashModel model) {
    return TrashEntity(
      className: model.className, // list of string
      image: model.image,
    );
  }

  static TrashModel fromEntity(TrashEntity entity) {
    return TrashModel(
      id: null,
      className: entity.className,
      confidence: [],
      image: entity.image,
    );
  }

  TrashModel copyWith({
    int? id,
    List<String>? className,
    List<double>? confidence,
    String? image,
  }) {
    return TrashModel(
      id: id ?? this.id,
      className: className ?? this.className,
      confidence: confidence ?? this.confidence,
      image: image ?? this.image,
    );
  }
}
