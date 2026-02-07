// مؤشر لحالة التطبيق (هل هو في حالة تحميل، نجاح، فشل، أو انقطاع إنترنت)
//  لتغيير واجهة المستخدم بناءً عليها
enum StateRequest {
  loading,
  success,
  failure,
  serverfailure,
  offlinefailure,
  none,
}
