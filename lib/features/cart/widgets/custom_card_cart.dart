import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class CustomCardCart extends StatelessWidget {
  final String imageName;
  final String itemsName;
  final int price;
  final int count;
  final void Function() onAdd;
  final void Function() onRemove;
  final void Function() onCard;
  const CustomCardCart({
    super.key,
    required this.imageName,
    required this.itemsName,
    required this.price,
    required this.onAdd,
    required this.count,
    required this.onRemove,
    required this.onCard,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCard,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child:
                  // مربع بخاصية التحريك
                  AnimatedContainer(
                    margin: EdgeInsets.only(right: 5), // 5 إلى اليمين
                    duration: Duration(milliseconds: 900), // زمن التحريك
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageName,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.broken_image),
                    ),
                  ),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                title: Text(itemsName, style: TextStyle(fontSize: 16)),
                subtitle: Text(
                  "$price \$",
                  style: TextStyle(color: MyColor.priceColor, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 35,
                    child: IconButton(
                      onPressed: onAdd,
                      icon: Icon(Icons.add_outlined),
                    ),
                  ),
                  SizedBox(height: 25, child: Text("${count}")),
                  SizedBox(
                    height: 25,
                    child: IconButton(
                      onPressed: onRemove,
                      icon: Icon(Icons.remove_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
