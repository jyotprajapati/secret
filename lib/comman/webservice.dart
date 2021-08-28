import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:notifications/comman/webserviceResponse.dart';

class WebserviceManager {
  static final String baseURL = "http://staging-api.canrivo.com";

  //Handles get request
  Future<WebserviceResponse> makeGetRequest(String url) async {
    WebserviceResponse wsResponse;
    // make GET request
    String mainUrl = baseURL + '/' + url;
    // Response response = await get(mainUrl);
    Response response = await get(
      Uri.parse(mainUrl),
      // Send authorization headers to the backend.
      headers: {},
    );
    String json = response.body;
    Map<dynamic, dynamic> jsonMap = jsonDecode(json);
    wsResponse = WebserviceResponse(response.statusCode, response.headers,
        jsonMap["data"], jsonMap["error"] != null, jsonMap["error"]);
    return wsResponse;
  }

// Method that handles post request without access token
  Future<WebserviceResponse> makePostRequest(String url, var jsonMap) async {
    WebserviceResponse wsResponse;
    // set up POST request arguments
    String mainUrl = baseURL + '/' + url;

    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    // make POST request
    print("json body" + jsonEncode(jsonMap));
    Response response = await post(Uri.parse(mainUrl),
        headers: headers, body: jsonEncode(jsonMap));
    // check the status code for the result
    // int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    Map<dynamic, dynamic> bodyMap = jsonDecode(body);
    wsResponse = WebserviceResponse(response.statusCode, response.headers,
        bodyMap["data"], bodyMap["error"] != null, bodyMap["error"]);
    return wsResponse;
  }
}
