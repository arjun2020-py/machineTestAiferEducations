import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/custom_conts/app_api_conts/app_api_conts.dart';
import '../model/feed_images_model.dart';

class FeedProvider extends ChangeNotifier {

  List<GetApiImagesModel> listFeedImages = [];
  bool isLoading = false;
  String error = "";

  Future<void> getFeedApi() async {

    isLoading = true;
    notifyListeners();

    try {

      final response = await http.get(
        Uri.parse(baseUrl + listEndPoint),
      );

      if (response.statusCode == 200) {

        listFeedImages = getApiImagesModelFromJson(response.body);

      } else {
        error = "Server error: ${response.statusCode}";
      }

    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}