class MyLinkApi {
  static const String hostServer =
      "https://electronicsstore.xo.je/electronics_store_php";

  static const String localPhoneServer = "http://192.168.1.8:8000/api";
  static const String localServer = "http://10.0.2.2:8000/api";

  // Auth
  static const String signupLink = "$localPhoneServer/signup";
  static const String loginLink = "$localPhoneServer/login";

  // forget password
  static const String chickemailLink =
      "$localPhoneServer/forgetpassword/checkemail";
  static const String verfiycodeLink =
      "$localPhoneServer/forgetpassword/verifycode";
  static const String resetpasswordLink =
      "$localPhoneServer/forgetpassword/reset";

  // home
  static const String homeLink = "$localPhoneServer/home";
  static const String itemsLink = "$localPhoneServer/items/view";
  static const String searchLink = "$localPhoneServer/items/search";

  // favorite
  static const String favoriteAdd = "$localPhoneServer/favorite/add";
  static const String favoriteRemove = "$localPhoneServer/favorite/remove";
  static const String favoriteView = "$localPhoneServer/favorite/view";

  // cart
  static const String cartAdd = "$localPhoneServer/cart/add";
  static const String cartRemove = "$localPhoneServer/cart/remove";
  static const String cartCount = "$localPhoneServer/cart/count";
  static const String cartView = "$localPhoneServer/cart/view";

  // address
  static const String addressAdd = "$localPhoneServer/address/add";
  static const String addressEdit = "$localPhoneServer/address/edit";
  static const String addressRemove = "$localPhoneServer/address/remove";
  static const String addressView = "$localPhoneServer/address/view";

  // coupon
  static const String checkcoupon = "$localPhoneServer/coupon/checkcoupon";

  // order
  static const String checkout = "$localPhoneServer/order/checkout";
  static const String ordersPending = "$localPhoneServer/order/pending";
  static const String ordersDetails = "$localPhoneServer/order/details";
}
