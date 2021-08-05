import 'dart:convert';
import 'package:api_base/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'api_urls.dart';

class ApiServices{
  Future<List<User>> fetchUser() {
    return http
        .get(ApiUrls().API_USER_LIST)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if(statusCode != 200 || jsonBody == null){
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['results'];
      return userList.map((contactRaw) => new User.fromJson(contactRaw)).toList();
    });
  }

}