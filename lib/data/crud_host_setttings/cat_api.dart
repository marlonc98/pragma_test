import 'package:pragma/data/crud_host_setttings/rest_api.dart';

class CatApi extends RestApi {
  CatApi() : super(hostUrl: "https://api.thecatapi.com/v1");

  @override
  Future<Map<String, String>> headers() async {
    return {
      "x-api-key":
          "live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr",
      "Content-Type": "application/json; charset=utf-8",
    };
  }
}
