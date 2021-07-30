
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm/models/user.dart';
import 'dart:convert' as json;
import 'package:mvvm/resources/utils/fetch_data_exception.dart';


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
        throw new FetchDataException("StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['results'];
      return userList.map((contactRaw) => new User.fromJson(contactRaw)).toList();
    });
  }


}