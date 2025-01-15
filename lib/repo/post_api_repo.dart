import 'dart:io';

import 'package:bloc_clean_code/model/post_api_model.dart';
import 'package:dio/dio.dart';

class PostAPIRepo {
  Future<List<PostsApiModel>> fetchPost() async {
    try {
      final response = await Dio().get(
        "https://jsonplaceholder.typicode.com/comments",
      );
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((e) => PostsApiModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load post");
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    } on HttpException {
      throw Exception("Couldn't find the post");
    } on FormatException {
      throw Exception("Bad response format");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
