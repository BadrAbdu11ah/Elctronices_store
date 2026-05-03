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
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: product,
              onChanged: onChanged,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) => onSearch(),
              decoration: InputDecoration(
                hintText: title,
                hintStyle: const TextStyle(fontSize: 18),
                prefixIcon: IconButton(
                  onPressed: onSearch,
                  icon: Icon(Icons.search_outlined, color: Colors.grey[600]),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: 10),
          _buildAppBarButton(
            onPressed: onOrder,
            icon: Icons.shopping_cart_outlined,
          ),
          if (isFavorite) ...[
            const SizedBox(width: 10),
            _buildAppBarButton(
              onPressed: onFavorite,
              icon: Icons.favorite_outline,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAppBarButton({
    required void Function()? onPressed,
    required IconData icon,
  }) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.grey[600]),
      ),
    );
  }
}
