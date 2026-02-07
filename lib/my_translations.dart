import 'package:electronics_store/data/datasource/static/my_text/cart.dart';
import 'package:electronics_store/data/datasource/static/my_text/checkout.dart';
import 'package:electronics_store/data/datasource/static/my_text/choose_language_text.dart';
import 'package:electronics_store/data/datasource/static/my_text/error_messages.dart';
import 'package:electronics_store/data/datasource/static/my_text/forget_password/forget_password.dart';
import 'package:electronics_store/data/datasource/static/my_text/home/home_page.dart';
import 'package:electronics_store/data/datasource/static/my_text/auth/login.dart';
import 'package:electronics_store/data/datasource/static/my_text/home/settings.dart';
import 'package:electronics_store/data/datasource/static/my_text/items/items.dart';
import 'package:electronics_store/data/datasource/static/my_text/on_boarding.dart';
import 'package:electronics_store/data/datasource/static/my_text/forget_password/reset_password.dart';
import 'package:electronics_store/data/datasource/static/my_text/auth/sign_up.dart';
import 'package:electronics_store/data/datasource/static/my_text/auth/success.dart';
import 'package:electronics_store/data/datasource/static/my_text/orders/order.dart';
import 'package:electronics_store/data/datasource/static/my_text/orders/order_details.dart';
import 'package:electronics_store/data/datasource/static/my_text/valid_input.dart';
import 'package:electronics_store/data/datasource/static/my_text/forget_password/verify_code.dart';
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
      ...errorMessagesAr,
      ...homeAr,
      ...settingsAr,
      ...itemsAr,
      ...cartAr,
      ...checkoutAr,
      ...ordersAr,
      ...statusAr,
      ...orderDetailsAr,
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
      ...errorMessagesEn,
      ...homeEn,
      ...settingsEn,
      ...itemsEn,
      ...cartEn,
      ...checkoutEn,
      ...ordersEn,
      ...statusEn,
      ...orderDetailsEn,
    },
  };
}
