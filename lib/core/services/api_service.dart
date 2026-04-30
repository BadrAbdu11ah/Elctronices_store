import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/function/check_internet.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  ApiService({required this.baseUrl});

  // // جلب التوكن المخزن عند تسجيل الدخول
  Future<String?> getToken() async => await storage.read(key: 'token');

  // // تجهيز الروأس (Headers) لكل طلب
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

  // // دالة GET لجلب البيانات (مثل الأقسام أو المنتجات)
  Future<Either<StateRequest, Map<String, dynamic>>> get(
    String endpoint, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlinefailure);
      }
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(auth: auth);
      final response = await http.get(url, headers: headers);

      return _handleResponse(response);
    } catch (_) {
      return const Left(StateRequest.serverfailure);
    }
  }

  // // دالة POST لإرسال بيانات جديدة (مثل إضافة منتج للسلة)
  Future<Either<StateRequest, Map<String, dynamic>>> post(
    String endpoint,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlinefailure);
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
      return const Left(StateRequest.serverfailure);
    }
  }

  // // دالة PUT لتحديث بيانات موجودة (مثل تعديل عنوان)
  Future<Either<StateRequest, Map<String, dynamic>>> put(
    String endpoint,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlinefailure);
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
      return const Left(StateRequest.serverfailure);
    }
  }

  // // دالة DELETE لحذف بيانات (مثل حذف منتج من السلة أو المفضلة)
  Future<Either<StateRequest, Map<String, dynamic>>> delete(
    String endpoint, {
    bool auth = true,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(StateRequest.offlinefailure);
      }
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(auth: auth);
      final response = await http.delete(url, headers: headers);
      return _handleResponse(response);
    } catch (_) {
      return const Left(StateRequest.serverfailure);
    }
  }

  // // معالجة الرد القادم من السيرفر وتحويله إلى Either
  Either<StateRequest, Map<String, dynamic>> _handleResponse(
    http.Response response,
  ) {
    // // طباعة الرد للتصحيح أثناء التطوير
    print("API Response [${response.statusCode}]: ${response.body}");

    final code = response.statusCode;
    if (code >= 200 && code < 300) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return Right(decoded);
      }
      return const Left(StateRequest.noData);
    } else if (code == 401) {
      return const Left(
        StateRequest.serverfailure,
      ); // // يمكن تخصيصها لخطأ المصادقة
    } else if (code == 404) {
      return const Left(
        StateRequest.serverfailure,
      ); // // لم يتم العثور على الصفحة
    }

    return const Left(StateRequest.failure);
  }
}
