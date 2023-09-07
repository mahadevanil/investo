import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:investo/constants/styles/colors.dart';
import 'package:investo/global/config/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investo/global/controller/global_controller.dart';
import 'package:provider/provider.dart';

//*-------------------------(base_url)
String baseUrl = Config().baseUrl;

//*----------------------------(enum for http methods)
enum HttpMethods { post, get, delete, patch }

//*----------------------------(network connectivity)
final Connectivity _connectivity = Connectivity();

Future<Response> httpApiCall(
    {required HttpMethods tHttp,
    Object? body,
    Map<String, String>? headers,
    required Uri url}) async {
  var connectionResult = await _connectivity.checkConnectivity();

  //*----------------------------(if connection Result is is mobile or wifi )
  if (connectionResult == ConnectivityResult.mobile ||
      connectionResult == ConnectivityResult.wifi) {
    try {
      switch (tHttp) {
        //*-----------------------------------(post method)
        case HttpMethods.post:
          return await http.post(url, body: body, headers: headers);
        //*-----------------------------------(get method)
        case HttpMethods.get:
          return await http.get(url, headers: headers);
        //*-----------------------------------(delete method)
        case HttpMethods.delete:
          return await http.delete(url, headers: headers);
        //*-----------------------------------(patch method)
        case HttpMethods.patch:
          return await http.patch(url, body: body, headers: headers);

        //*-----------------------------------(default post method)
        default:
          return await http.post(url, body: body, headers: headers);
      }
      //*-----------------------------------(platform exception)
    } on PlatformException catch (e) {
      log(e.toString(), name: 'PlatformException');
      return Response('{"code":"500"}', 500);
      //*-----------------------------------(format exception)
    } on FormatException catch (e) {
      log(e.toString(), name: 'FormatException');
      return Response('{"code":"500"}', 500);
    } catch (e) {
      log(e.toString(), name: 'Api error');
      return Response('{"code":"500"}', 500);
    }
  } else {
    //*----------------------------(when there is no internet connection)
    //todo: Navigate to network error screen
    Fluttertoast.showToast(
        msg: "Please connect to internet",
        backgroundColor: kRed,
        textColor: kWhite,
        fontSize: 16.0);
    return Response('{"code":"500"}', 500);
  }
}

//*------------------------------(http request method)
Future<Response> httpRequests(
    {required String url,
    required HttpMethods httpType,
    Object? body,
    Map<String, String>? headers,
    int timeOut = 30,
    bool setAppLoading = true}) async {
  final globalCnt = Provider.of<GlobalController>(globalContext, listen: false);
  globalCnt.changeApiLoading(setAppLoading);
  log('----------------------------------(Api request data logs)------------------');
  log(url, name: 'API Url');
  log(body.toString(), name: 'Request body');
  log('--------------------------------------------------------------');
  final response = await httpApiCall(
          tHttp: httpType, url: Uri.parse(url), body: body, headers: headers)
      .timeout(Duration(seconds: timeOut), onTimeout: () {
         globalCnt.changeApiLoading(false);
    return Response('{"code":408000,}', 400);
  });
  globalCnt.changeApiLoading(false);
  return response;

}
