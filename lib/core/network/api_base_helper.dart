import 'dart:convert';
import 'dart:io';
import 'package:amiy_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../errors/exceptions.dart';
import '../utils/colors.dart';

class ApiBaseHelper {
  Future<dynamic> get(String endPoint) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(endPoint));
      responseJson = _returnResponse(response);
    } on SocketException {
      Fluttertoast.showToast(
          msg: AppConstants.noInternet,
          textColor: const Color(AppColors.white));
    } on UnauthorisedException {
      Fluttertoast.showToast(
          msg: AppConstants.unAuthorised,
          textColor: const Color(AppColors.white));
    }
    return responseJson;
  }

  Future<dynamic> post(String endPoint, Map<String, dynamic> body) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(endPoint),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      Fluttertoast.showToast(
          msg: AppConstants.noInternet,
          textColor: const Color(AppColors.white));
    } on UnauthorisedException {
      Fluttertoast.showToast(
          msg: AppConstants.unAuthorised,
          textColor: const Color(AppColors.white));
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201: // Handle created status for POST
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with Server with StatusCode : ${response.statusCode}');
    }
  }
}
