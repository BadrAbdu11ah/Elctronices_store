import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StateRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkurl),
          body: data,
          headers: {"Accept": "application/json"},
        );
        print(
          "========================= response.statusCode: ${response.statusCode}",
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print("============== responseBody: $responseBody");
          return Right(responseBody);
        } else {
          return const Left(StateRequest.failure);
        }
      } else {
        return const Left(StateRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StateRequest.serverfailure);
    }
  }
}
