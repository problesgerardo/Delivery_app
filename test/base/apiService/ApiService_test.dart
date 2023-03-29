import 'package:flutter_test/flutter_test.dart';

import 'mocks/ApiMocks_test.dart';
import 'package:delivery_app/src/base/apiService/apiService.dart';


abstract class _Constants {
  static Map<String, String> defaultHeaders = {'Content-type': 'application/json; charset=UTF-8'};
  static String postEndpoint = "https://jsonplaceholder.typicode.com/posts";
  static String getEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
  static String putEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
  
}

void main() {

  final ApiService _testApiService = DefaultApiService(); 
  
  group('Test correct Connection of Api Service', () {

    test('Test correct POST Connection to JsonPlaceholder', () async {

      final bodyParams = CorrectPostBodyParams(title: 'foo', body: 'bar', userId: 1 );
      final result = await _testApiService.getDataFromPostRequest(
        bodyParameters: bodyParams.toJson(), 
        url: _Constants.postEndpoint,
        headers: _Constants.defaultHeaders,
      );

      expect(result, Map.from(result));
    });

    test("Test correct GET Connection to JsonPlaceholder", () async {
      
      final result = await _testApiService.getDataFromGetRequest(url: _Constants.getEndpoint);

      expect(result, Map.from(result));

    });

    test("Test correct PUT Connection to JsonPlaceholder", () async {
      
      final body = CorrectPutBodyParams( id: 1, title: "foo", body: "bar", userId: 1);

      final result = await _testApiService.getDataFromPutRequest(
        bodyParameters: body.toJson(),
        url: _Constants.putEndpoint,
        headers: _Constants.defaultHeaders,
      );

      expect(result, Map.from(result));

    });

  });

}