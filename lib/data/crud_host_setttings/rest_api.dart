import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/utils/error_constants.dart';

class RestApi {
  String hostUrl = '';

  RestApi({required this.hostUrl});

  Future<Map<String, String>> headers() async {
    return {"Content-Type": "application/json; charset=utf-8"};
  }

  Future<String?> post(relativeUrl, values) async {
    Map<String, String> headers = await this.headers();
    Uri url = Uri.parse(hostUrl + relativeUrl);
    Future<http.Response> response =
        http.post(url, headers: headers, body: json.encode(values));
    return await parseResponse(
        response, relativeUrl, 'POST', json.encode(values));
  }

  Future<String?> get(relativeUrl) async {
    Map<String, String> headers = await this.headers();
    Uri url = Uri.parse(hostUrl + relativeUrl);
    Future<http.Response> response = http.get(url, headers: headers);
    return await parseResponse(response, relativeUrl, 'GET', '');
  }


  Future<String?> parseResponse(Future<http.Response> petition,
      String relativeUrl, String method, String body) async {
    try {
      http.Response response = await petition;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response.body;
      } else {
        try {
          log(response.body);
          Map<String, dynamic> responseJson = jsonDecode(response.body);
          Map<String, Object> resume = {
            "relativeUrl": relativeUrl,
            "payload": body,
            "method": method,
            "statusCode": response.statusCode,
            "response": responseJson.toString()
          };

          throw ExceptionEntity(
            message: resume.toString(),
            code: responseJson['code'] != null
                ? "server_error_${responseJson['code']}"
                : ExceptionEntity.unknownError,
          );
        } catch (e) {
            throw ExceptionEntity.fromException(e);
        }
      }
    } catch (e) {
      if (e is http.ClientException) {
        throw ExceptionEntity(
            code: ErrorConstants.noConnectionError);
      }
      throw ExceptionEntity.fromException(e);
    }
  }
}
