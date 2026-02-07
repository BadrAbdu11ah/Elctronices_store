import 'package:electronics_store/data/datasource/static/my_text.dart';

Map<String, String> errorMessagesAr = {
  // Dialog Titles
  MyText.alert: "تنبيه",
  MyText.warning: "تحذير",

  // General Dialog Messages
  MyText.messagewarningAlready: "حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقًا",
  MyText.unexpectedError: "حدث خطأ غير متوقع",

  // Network Errors
  MyText.checkInternet: "تحقق من الاتصال بالإنترنت",

  // Backend Error Keys
  MyText.emailNotFoundOrNotApproved:
      "البريد الإلكتروني غير موجود أو الحساب غير مُفعل",
  MyText.passwordIncorrect: "كلمة المرور غير صحيحة",
  MyText.passwordsNotMatch: "كلمتا المرور غير متطابقتين",
  MyText.emailNotFound: "البريد الإلكتروني غير موجود",
  MyText.emailOrPhoneExists: "البريد الإلكتروني أو رقم الجوال مستخدم مسبقًا",
  MyText.verificationCodeIncorrect: "رمز التحقق غير صحيح",
  MyText.passwordsNotMatchDialog: "كلمتا المرور غير متطابقتين، أعد إدخالهما",
  MyText.accountNotActive: "حسابك غير مفعّل. هل ترغب في تفعيل حسابك الآن؟",
  MyText.noData: "لا توجد بيانات",

  // Buttons
  MyText.activateNow: "تفعيل الآن",
  MyText.cancel: "إلغاء",
};

Map<String, String> errorMessagesEn = {
  // Dialog Titles
  MyText.alert: "Alert",
  MyText.warning: "Warning",

  // General Dialog Messages
  MyText.messagewarningAlready: "Something went wrong, please try again later",
  MyText.unexpectedError: "An unexpected error occurred",

  // Network Errors
  MyText.checkInternet: "Check your internet connection",

  // Backend Error Keys
  MyText.emailNotFoundOrNotApproved: "Email not found or account not approved",
  MyText.passwordIncorrect: "Incorrect password",
  MyText.passwordsNotMatch: "Passwords do not match",
  MyText.emailNotFound: "Email not found",
  MyText.emailOrPhoneExists: "Email or phone number already exists",
  MyText.verificationCodeIncorrect: "Invalid verification code",
  MyText.passwordsNotMatchDialog: "Passwords do not match, please re-enter",
  MyText.accountNotActive:
      "Your account is not activated. Would you like to activate it now?",
  MyText.noData: "No data available",

  // Buttons
  MyText.activateNow: "Activate Now",
  MyText.cancel: "Cancel",
};
