import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:get/get.dart';

String? validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return MyText.invalidUsername.tr; // Username is not valid
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return MyText.invalidEmail.tr; // Email is not valid
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return MyText.invalidPhone.tr; // Phone number is not valid
    }
  }
  if (val.isEmpty) {
    return MyText.emptyField.tr; // This field cannot be empty
  }
  if (val.length < min) {
    return MyText.inputTooShort.tr; // Input is too short
  }
  if (val.length > max) {
    return MyText.inputTooLong.tr; // Input is too long
  }
  return null;
}
