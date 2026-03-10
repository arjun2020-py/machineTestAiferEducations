import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/custom_conts/app_api_conts/app_api_conts.dart';
import '../model/feed_images_model.dart';
part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit(this.context) : super(FeedInitial())
  {
    getFeedApi();
  }
  BuildContext context;
  List<GetApiImagesModel> listFeedImages = [];
  getFeedApi() async {
    final response = await http.get(Uri.parse(baseUrl + listEndPoint));
    try {
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        listFeedImages = List<GetApiImagesModel>.from(
          responseData.map((x) => GetApiImagesModel.fromJson(x)),
        );
        emit(FeedImageList(listFeedImages: listFeedImages));
      }
    } catch (e) {
      emit(FeedError(error: 'Error fetching data: $e'));
    }
  }
 
}
