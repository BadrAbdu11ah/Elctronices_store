import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/Material.dart';

class CustomBottomItem extends StatelessWidget {
  final String titleGoToCart;
  final String titleAdd;
  final void Function() onGoToCart;
  final void Function() onAdd;
  const CustomBottomItem({
    super.key,
    required this.titleGoToCart,
    required this.onGoToCart,
    required this.titleAdd,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 45,
            child: MaterialButton(
              color: MyColor.themeBlackColor,
              onPressed: onAdd,
              child: Text(
                titleAdd,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: MaterialButton(
              color: MyColor.themeBlackColor,
              onPressed: onGoToCart,
              child: Text(
                titleGoToCart,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
