import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onRemove;
  final String count;
  final String price;
  final String discountedPrice;
  final int discount;
  const PriceAndCount({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.count,
    required this.price,
    required this.discountedPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: MyColor.themeColor!, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(count),
            ),
            IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        discount > 0
            ? Row(
                children: [
                  Text(
                    "$price \$",
                    style: TextStyle(
                      fontSize: 13,
                      color: MyColor.priceColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "$discountedPrice \$",
                    style: TextStyle(
                      fontSize: 18,
                      color: MyColor.priceColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Text(
                "$price \$",
                style: TextStyle(
                  fontSize: 18,
                  color: MyColor.priceColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}
