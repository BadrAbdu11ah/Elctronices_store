import 'package:electronics_store/features/address/binding/add_binding.dart';
import 'package:electronics_store/features/address/binding/add_details_binding.dart';
import 'package:electronics_store/features/address/binding/edit_binding.dart';
import 'package:electronics_store/features/address/binding/view_binding.dart';
import 'package:electronics_store/features/cart/binding/cart_page_binding.dart';
import 'package:electronics_store/features/check_out/binding/check_out_binding.dart';
import 'package:electronics_store/features/favorite/binding/favorite_page_binding.dart';
import 'package:electronics_store/features/auth/pages/forget_password/binding/forget_password_binding.dart';
import 'package:electronics_store/features/auth/pages/login/login_binding.dart';
import 'package:electronics_store/features/home/binding/home_screen_binding.dart';
import 'package:electronics_store/features/items/binding/items_binding.dart';
import 'package:electronics_store/features/items/binding/items_details_binding.dart';
import 'package:electronics_store/features/on_boarding/binding/on_boarding_binding.dart';
import 'package:electronics_store/features/auth/pages/forget_password/binding/reset_password_binding.dart';
import 'package:electronics_store/features/auth/pages/sign_up/binding/sign_up_binding.dart';
import 'package:electronics_store/features/auth/pages/forget_password/binding/success_reset_password_binding.dart';
import 'package:electronics_store/features/auth/pages/sign_up/binding/success_sign_up_binding.dart';
import 'package:electronics_store/features/auth/pages/forget_password/binding/verfiy_code_password_binding.dart';
import 'package:electronics_store/features/auth/pages/sign_up/binding/verfiy_code_sign_up_binding.dart';
import 'package:electronics_store/features/orders/binding/details_binding.dart';
import 'package:electronics_store/features/orders/binding/pending_binding.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/middlewares/my_middlewares.dart';
import 'package:electronics_store/features/address/view/add.dart';
import 'package:electronics_store/features/address/view/add_details.dart';
import 'package:electronics_store/features/address/view/edit.dart';
import 'package:electronics_store/features/address/view/view.dart';
import 'package:electronics_store/features/cart/view/cart.dart';
import 'package:electronics_store/features/check_out/view/check_out.dart';
import 'package:electronics_store/features/auth/pages/forget_password/view/forget_password.dart';
import 'package:electronics_store/features/auth/pages/forget_password/view/reset_password.dart';
import 'package:electronics_store/features/auth/pages/forget_password/view/success_reset_password.dart';
import 'package:electronics_store/features/auth/pages/forget_password/view/verfiy_code_password.dart';
import 'package:electronics_store/features/auth/pages/login/login.dart';
import 'package:electronics_store/features/auth/pages/sign_up/view/sign_up.dart';
import 'package:electronics_store/features/auth/pages/sign_up/view/success_sign_up.dart';
import 'package:electronics_store/features/auth/pages/sign_up/view/verfiy_code_sign_up.dart';
import 'package:electronics_store/features/choose_language/view/choose_language.dart';
import 'package:electronics_store/features/favorite/view/favorite.dart';
import 'package:electronics_store/features/home/view/home_screen.dart';
import 'package:electronics_store/features/items/view/items.dart';
import 'package:electronics_store/features/items/view/items_details.dart';
import 'package:electronics_store/features/on_boarding/view/on_boarding.dart';
import 'package:electronics_store/features/orders/view/details.dart';
import 'package:electronics_store/features/orders/view/pending.dart';
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
