import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function() onSearch;
  final TextEditingController product;
  final void Function() onOrder;
  final void Function()? onFavorite;
  final bool isFavorite;
  final void Function(String) onChanged;
  const CustomAppBar({
    super.key,
    required this.product,
    required this.onOrder,
    required this.onSearch,
    required this.title,
    this.onFavorite,
    this.isFavorite = true,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: product,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: title,
                hintStyle: TextStyle(fontSize: 18),
                prefixIcon: IconButton(
                  onPressed: onSearch,
                  icon: Icon(Icons.search_outlined, color: Colors.grey[600]),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onOrder,
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey[600]),
            ),
          ),
          SizedBox(width: 10),
          if (isFavorite)
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: onFavorite,
                icon: Icon(Icons.favorite_outline, color: Colors.grey[600]),
              ),
            ),
        ],
      ),
    );
  }
}
