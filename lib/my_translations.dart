import 'package:electronics_store/data/datasource/static/my_text/choose_language_text.dart';
import 'package:electronics_store/data/datasource/static/my_text/forget_password.dart';
import 'package:electronics_store/data/datasource/static/my_text/login.dart';
import 'package:electronics_store/data/datasource/static/my_text/on_boarding.dart';
import 'package:electronics_store/data/datasource/static/my_text/reset_password.dart';
import 'package:electronics_store/data/datasource/static/my_text/sign_up.dart';
import 'package:electronics_store/data/datasource/static/my_text/success.dart';
import 'package:electronics_store/data/datasource/static/my_text/valid_input.dart';
import 'package:electronics_store/data/datasource/static/my_text/verify_code.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      ...chooseLanguageAr,
      ...onBoardingAr,
      ...loginAr,
      ...signUpAr,
      ...forgetPasswordAr,
      ...verifyCodeAr,
      ...resetPasswordAr,
      ...successAr,
      ...validInputAr,
    },
    "en": {
      ...chooseLanguageEn,
      ...onBoardingEn,
      ...loginEn,
      ...signUpEn,
      ...forgetPasswordEn,
      ...verifyCodeEn,
      ...resetPasswordEn,
      ...successEn,
      ...validInputEn,
    },
  };
}
