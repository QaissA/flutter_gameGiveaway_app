import 'dart:convert';

import 'package:bloc_api/Models/data_model.dart';
import 'package:http/http.dart' as http;

class RepoGame {
  Future<List<DataModel>?> getGamesData() async {
    String url = "https://www.gamerpower.com/api/giveaways";
    final result = await http.Client().get(Uri.parse(url));
    if (result.statusCode != 200) {
      return null;
    } else {
      var data = json.decode(result.body);

      List<DataModel> dataModels = [];
      for (var model in data) {
        DataModel dataModel = DataModel.fromJson(model);
        dataModels.add(dataModel);
      }
      return dataModels;
    }
  }
}
