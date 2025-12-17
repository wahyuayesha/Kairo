import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kairo/data/models/wasteInfoModel.dart';

class Wasteinfodatasource {
  Future<List<WasteInfoModel>> fetchWasteInfo() async {
    final json = await rootBundle.loadString('assets/jsons/waste_info.json');
    final data = jsonDecode(json);
    return (data as List).map((e) => WasteInfoModel.fromJson(e)).toList();
  }
}
