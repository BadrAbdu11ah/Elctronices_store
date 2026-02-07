import 'dart:async';
import 'dart:io';

Future<bool> checkInternet() async {
  try {
    final result = await InternetAddress.lookup(
      'google.com',
    ).timeout(const Duration(seconds: 5));

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  } on TimeoutException catch (_) {
    return false;
  }
  return false;
}
