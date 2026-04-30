class ApiEndpoints {
  // // السيرفر المحلي (تعدل هنا مرة واحدة فقط)
  static const String server = "http://192.168.1.8:8000/api";

  // // -----------------------------------------------------------
  // // 1. مسارات المصادقة (Auth)
  // // -----------------------------------------------------------
  static const String login = "/login";
  static const String signup = "/signup";

  // // استعادة كلمة المرور
  static const String checkEmail = "/forgetpassword/checkemail";
  static const String verifyCode = "/forgetpassword/verifycode";
  static const String resetPassword = "/forgetpassword/reset-password";

  // // -----------------------------------------------------------
  // // 2. الرئيسية والمنتجات (Home & Items)
  // // -----------------------------------------------------------
  static const String home = "/home";
  static const String search = "/items/search";

  // // جلب منتجات قسم محدد عبر الـ ID في الرابط
  static String itemsByCategory(int id) => "/items/category/$id";

  // // -----------------------------------------------------------
  // // 3. المفضلة (Favorite)
  // // -----------------------------------------------------------
  static const String favoriteView = "/favorite/view";
  static String favoriteAdd(int id) => "/favorite/add/$id";
  static String favoriteRemove(int id) => "/favorite/remove/$id";

  // // -----------------------------------------------------------
  // // 4. السلة (Cart)
  // // -----------------------------------------------------------
  static const String cartView = "/cart/view";
  static String cartAdd(int id) => "/cart/add/$id";
  static String cartRemove(int id) => "/cart/remove/$id";
  static String cartCount(int id) => "/cart/count/$id";

  // // -----------------------------------------------------------
  // // 5. العناوين (Address)
  // // -----------------------------------------------------------
  static const String addressView = "/address/view";
  static const String addressAdd = "/address/add";
  static String addressEdit(int id) => "/address/edit/$id";
  static String addressRemove(int id) => "/address/remove/$id";

  // // -----------------------------------------------------------
  // // 6. الكوبونات والطلبات (Coupon & Orders)
  // // -----------------------------------------------------------
  static String checkCoupon(String name) => "/coupon/check/$name";

  static const String checkout = "/order/checkout";
  static const String pending = "/order/pending";
  static String orderDetails(int id) => "/order/details/$id";
}
