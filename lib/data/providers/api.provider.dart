import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_library/core/values/enums.dart';
import 'package:open_library/data/models/entities/request.model.dart';

class ApiProvider {
  // Singleton
  ApiProvider._privateConstructor();
  static final ApiProvider _instance = ApiProvider._privateConstructor();
  static ApiProvider get instance => _instance;
  // End Singleton

  Future<RequestModel> request<T>(RequestMethod method, String endPoint, {String body = '', bool returnFullResponse = false, Map<String, String>? addHeaders}) async {

    const int maxRetries = 3;
    int retryCount = 0;
    bool success = false;
    http.Response resp;
    RequestModel responseModel=RequestModel(result: "");

    final Map<String, String> headers = <String, String>{};


    if(addHeaders!=null) {
      headers.addAll(addHeaders);
    }else{
      headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
      headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'Access-Control-Allow-Origin');
    }

    final Uri url = Uri.parse(endPoint);

    while (retryCount < maxRetries && !success) {
      try {
        switch(method){
          case RequestMethod.get:
            resp = await http.get(
                url,
                headers: headers);
            break;
          case RequestMethod.put:
            resp = await http.put(
                url,
                headers: headers,
                body: body);
            break;
          case RequestMethod.post:
            resp = await http.post(
                url,
                headers: headers,
                body: body);
            break;
          case RequestMethod.patch:
            resp = await http.patch(
                url,
                headers: headers,
                body: body);
            break;
          case RequestMethod.delete:
            resp = await http.delete(
                url,
                headers: headers);
            break;
        }

        responseModel = _validStatusCode(resp);
        if(responseModel.code=="201" || responseModel.code=="200"){
          success = true;
        }

      } on TimeoutException catch (_) {
        responseModel= RequestModel(result: "tiempo de espera agotado, intente nuevamente",code: "402");
      } on SocketException catch(r) {
        responseModel= RequestModel(result: r.message,code: r.port.toString());
      } on Error catch (e) {
        responseModel= RequestModel(result: e.toString(),code: "404");
      }

      // Incrementa el contador de intentos si no ha tenido éxito
      if (!success) {
        retryCount++;

        print(responseModel.code.toString());
        debugPrintStack(label: responseModel.result);

        if (retryCount < maxRetries) {
          // Espera 1 segundo antes de intentar de nuevo
          await Future.delayed(const Duration(seconds: 1));
        }
      }
    }
    return responseModel;
  }

  RequestModel _validStatusCode(http.Response? response) {
    if (response != null) {
      switch (response.statusCode) {
        case 200:
        case 201:
          return RequestModel(result: response.body,code: response.statusCode.toString(),isError: false);
        case 400:
        case 401: //invalid auth
        case 403:
        case 307:
        case 500:
        case 502:
          return RequestModel(
              result: response.body.isEmpty?response.reasonPhrase??"exception": response.body,
              code: response.statusCode.toString()
          );
        default:
          return RequestModel(result: "Error al comunicar con el servidor" ,code: response.statusCode.toString());
      }
    } else {
      return RequestModel(result: "Error occured while Communication", code: "404");
    }
  }
}
