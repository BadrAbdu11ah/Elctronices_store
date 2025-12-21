import 'package:electronics_store/bindings/forget_password_binding.dart';
import 'package:electronics_store/bindings/login_binding.dart';
import 'package:electronics_store/bindings/on_boarding_binding.dart';
import 'package:electronics_store/bindings/reset_password_binding.dart';
import 'package:electronics_store/bindings/sign_up_binding.dart';
import 'package:electronics_store/bindings/success_reset_password_binding.dart';
import 'package:electronics_store/bindings/success_sign_up_binding.dart';
import 'package:electronics_store/bindings/verfiy_code_password_binding.dart';
import 'package:electronics_store/bindings/verfiy_code_sign_up_binding.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/middlewares/my_middlewares.dart';
import 'package:electronics_store/view/screen/auth/forget_password/forget_password.dart';
import 'package:electronics_store/view/screen/auth/forget_password/reset_password.dart';
import 'package:electronics_store/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:electronics_store/view/screen/auth/forget_password/verfiy_code_password.dart';
import 'package:electronics_store/view/screen/auth/login.dart';
import 'package:electronics_store/view/screen/auth/sign_up.dart';
import 'package:electronics_store/view/screen/auth/success_sign_up.dart';
import 'package:electronics_store/view/screen/auth/verfiy_code_sign_up.dart';
import 'package:electronics_store/view/screen/choose_language.dart';
import 'package:electronics_store/view/screen/on_boarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> pages = [
  GetPage(
    name: "/",
    page: () => const ChooseLanguage(),
    middlewares: [MyMiddlewares()],
  ),
  // onboarding
  GetPage(
    name: MyPages.onBoarding,
    page: () => const OnBoarding(),
    binding: OnBoardingBinding(),
  ),

  // auth - login
  GetPage(
    name: MyPages.login,
    page: () => const Login(),
    binding: LoginBinding(),
  ),

  // auth - sign up
  GetPage(
    name: MyPages.signUp,
    page: () => const SignUp(),
    binding: SignUpBinding(),
  ),

  GetPage(
    name: MyPages.verfiyCodeSginUp,
    page: () => const VerfiyCodeSignUp(),
    binding: VerfiyCodeSignUpBinding(),
  ),

  GetPage(
    name: MyPages.successSignUp,
    page: () => const SuccessSignUp(),
    binding: SuccessSignUpBinding(),
  ),

  // auth - forget password
  GetPage(
    name: MyPages.forgetPassword,
    page: () => const ForgetPassword(),
    binding: ForgetPasswordBinding(),
  ),

  GetPage(
    name: MyPages.verfiyCodePassword,
    page: () => const VerfiyCodePassword(),
    binding: VerfiyCodePasswordBinding(),
  ),

  GetPage(
    name: MyPages.resetPassword,
    page: () => const ResetPassword(),
    binding: ResetPasswordBinding(),
  ),

  GetPage(
    name: MyPages.successForgetPassword,
    page: () => const SuccessResetPassword(),
    binding: SuccessResetPasswordBinding(),
  ),
];
