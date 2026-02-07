import 'package:electronics_store/bindings/address/add_binding.dart';
import 'package:electronics_store/bindings/address/add_details_binding.dart';
import 'package:electronics_store/bindings/address/edit_binding.dart';
import 'package:electronics_store/bindings/address/view_binding.dart';
import 'package:electronics_store/bindings/cart_page_binding.dart';
import 'package:electronics_store/bindings/check_out_binding.dart';
import 'package:electronics_store/bindings/favorite_page_binding.dart';
import 'package:electronics_store/bindings/forget_password/forget_password_binding.dart';
import 'package:electronics_store/bindings/auth/login_binding.dart';
import 'package:electronics_store/bindings/home/home_screen_binding.dart';
import 'package:electronics_store/bindings/items_binding.dart';
import 'package:electronics_store/bindings/items_details_binding.dart';
import 'package:electronics_store/bindings/on_boarding_binding.dart';
import 'package:electronics_store/bindings/forget_password/reset_password_binding.dart';
import 'package:electronics_store/bindings/auth/sign_up_binding.dart';
import 'package:electronics_store/bindings/forget_password/success_reset_password_binding.dart';
import 'package:electronics_store/bindings/auth/success_sign_up_binding.dart';
import 'package:electronics_store/bindings/forget_password/verfiy_code_password_binding.dart';
import 'package:electronics_store/bindings/auth/verfiy_code_sign_up_binding.dart';
import 'package:electronics_store/bindings/orders/details_binding.dart';
import 'package:electronics_store/bindings/orders/pending_binding.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/middlewares/my_middlewares.dart';
import 'package:electronics_store/view/address/add.dart';
import 'package:electronics_store/view/address/add_details.dart';
import 'package:electronics_store/view/address/edit.dart';
import 'package:electronics_store/view/address/view.dart';
import 'package:electronics_store/view/screen/cart.dart';
import 'package:electronics_store/view/screen/check_out.dart';
import 'package:electronics_store/view/screen/forget_password/forget_password.dart';
import 'package:electronics_store/view/screen/forget_password/reset_password.dart';
import 'package:electronics_store/view/screen/forget_password/success_reset_password.dart';
import 'package:electronics_store/view/screen/forget_password/verfiy_code_password.dart';
import 'package:electronics_store/view/screen/auth/login.dart';
import 'package:electronics_store/view/screen/auth/sign_up.dart';
import 'package:electronics_store/view/screen/auth/success_sign_up.dart';
import 'package:electronics_store/view/screen/auth/verfiy_code_sign_up.dart';
import 'package:electronics_store/view/screen/choose_language.dart';
import 'package:electronics_store/view/screen/favorite/favorite.dart';
import 'package:electronics_store/view/screen/home/home_screen.dart';
import 'package:electronics_store/view/screen/items/items.dart';
import 'package:electronics_store/view/screen/items/items_details.dart';
import 'package:electronics_store/view/screen/on_boarding.dart';
import 'package:electronics_store/view/screen/orders/details.dart';
import 'package:electronics_store/view/screen/orders/pending.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> pages = [
  // GetPage(name: "/", page: () => const GeolocatorLearning()),
  GetPage(
    name: "/",
    page: () => const ChooseLanguage(),
    middlewares: [MyMiddlewares()],
  ),
  GetPage(
    name: MyPages.homeScreen,
    page: () => const HomeScreen(),
    binding: HomeScreenBinding(),
  ),
  GetPage(
    name: MyPages.items,
    page: () => const Items(),
    binding: ItemsBinding(),
  ),
  GetPage(
    name: MyPages.itemsDetails,
    page: () => const ItemsDetails(),
    binding: ItemsDetailsBinding(),
  ),
  GetPage(
    name: MyPages.favorite,
    page: () => const Favorite(),
    binding: FavoritePageBinding(),
  ),
  GetPage(
    name: MyPages.cart,
    page: () => const Cart(),
    binding: CartPageBinding(),
  ),
  GetPage(
    name: MyPages.checkOut,
    page: () => const CheckOut(),
    binding: CheckOutBinding(),
  ),

  // orders
  GetPage(
    name: MyPages.ordersPending,
    page: () => const OrdersPending(),
    binding: OrdersPendingBinding(),
  ),
  GetPage(
    name: MyPages.ordersDetails,
    page: () => const OrdersDetails(),
    binding: OrdersDetailsBinding(),
  ),

  // address
  GetPage(
    name: MyPages.addressAdd,
    page: () => const AddressAdd(),
    binding: AddressAddBinding(),
  ),
  GetPage(
    name: MyPages.addressAddDetails,
    page: () => const AddressAddDetails(),
    binding: AddressAddDetailsBinding(),
  ),
  GetPage(
    name: MyPages.addressEdit,
    page: () => const AddressEdit(),
    binding: AddressEditBinding(),
  ),
  GetPage(
    name: MyPages.addressView,
    page: () => const AddressView(),
    binding: AddressViewBinding(),
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
