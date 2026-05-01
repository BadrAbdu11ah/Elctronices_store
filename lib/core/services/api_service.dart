import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/function/check_internet.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final MyService myService;
  final String baseUrl;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  ApiService({required this.baseUrl, required this.myService});

  // جلب التوكن المخزن عند تسجيل الدخول
  Future<String?> getToken() async => await storage.read(key: 'token');

  // تجهيز الروأس لكل طلب
  Future<Map<String, String>> _getHeaders({bool auth = true}) async {
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (auth) {
      final token = await getToken();
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  //  جلب البيانات
  Future<Either<StateRequest, Map<String, dynamic>>> get(
    String endpoint, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlineFailure);
      }
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(auth: auth);
      final response = await http.get(url, headers: headers);

      return _handleResponse(response);
    } catch (_) {
      return const Left(StateRequest.serverFailure);
    }
  }

  // إرسال بيانات جديدة
  Future<Either<StateRequest, Map<String, dynamic>>> post(
    String endpoint,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlineFailure);
      }
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(auth: auth);
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (e) {
      return const Left(StateRequest.serverFailure);
    }
  }

  // تحديث بيانات موجودة
  Future<Either<StateRequest, Map<String, dynamic>>> put(
    String endpoint,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlineFailure);
      }
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(auth: auth);
      final response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (_) {
      return const Left(StateRequest.serverFailure);
    }
  }

  //   حذف بيانات
  Future<Either<StateRequest, Map<String, dynamic>>> delete(
    String endpoint, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlineFailure);
      }
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(auth: auth);
      final response = await http.delete(url, headers: headers);
      return _handleResponse(response);
    } catch (_) {
      return const Left(StateRequest.serverFailure);
    }
  }

  Either<StateRequest, Map<String, dynamic>> _handleResponse(
    http.Response response,
  ) {
    print("API Response [${response.statusCode}]: ${response.body}");

    final code = response.statusCode;
    if (code >= 200 && code < 300) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return Right(decoded);
      }
      return const Left(StateRequest.noData);
    } else if (code == 401) {
      //  خطأ المصادقة
      return const Left(StateRequest.serverFailure);
    } else if (code == 404) {
      //  لم يتم العثور على الصفحة
      return const Left(StateRequest.serverFailure);
    }

    return const Left(StateRequest.failure);
  }
}
