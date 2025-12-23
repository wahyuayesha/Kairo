import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kairo/core/config.dart';
import 'package:kairo/data/models/trashModel.dart';

class Predictdatasource {
  Future<TrashModel?> predict(File trashImage) async {
    try {
      final File file = trashImage;
      final bytes = await file.readAsBytes();
      final base64Image = base64Encode(bytes);

      final response = await http.post(
        Uri.parse('${Config.backendAddress}/predict'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"image": base64Image}),
      );
      print("RESPONSE: ${response.body}");
      print("STATUS: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return TrashModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to predict trash: ${e.toString()}');
    }
  }
}
