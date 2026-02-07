import 'package:electronics_store/data/datasource/static/my_text.dart';

Map<String, String> ordersAr = {
  MyText.ordersTitle: "الطلبات",
  MyText.paymentMethod: "طريقة الدفع:",
  MyText.orderType: "نوع الطلب:",
  MyText.orderStatus: "حالة الطلب:",
  MyText.details: "التفاصيل",
};

Map<String, String> ordersEn = {
  MyText.ordersTitle: "Orders",
  MyText.paymentMethod: "Payment Method",
  MyText.orderType: "Order Type",
  MyText.orderStatus: "Order Status",
  MyText.details: "Details",
};

Map<String, String> statusAr = {
  MyText.ordersPaymentCash: "الدفع عند الاستلام",
  MyText.ordersPaymentCards: "بطاقات الدفع",

  MyText.ordersDelivery: "توصيل",
  MyText.ordersDriveThru: "استلام من الفرع",

  MyText.ordersWaiting: "قيد الانتظار",
  MyText.ordersPreparing: "قيد التحضير",
  MyText.ordersArchived: "مؤرشف",
};

Map<String, String> statusEn = {
  MyText.ordersPaymentCash: "Cash on Delivery",
  MyText.ordersPaymentCards: "Payment Cards",

  MyText.ordersDelivery: "Delivery",
  MyText.ordersDriveThru: "Drive Thru",

  MyText.ordersWaiting: "Waiting...",
  MyText.ordersPreparing: "Order in preparation",
  MyText.ordersArchived: "Archived",
};
