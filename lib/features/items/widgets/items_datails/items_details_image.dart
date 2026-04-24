import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/Material.dart';

class ItemsDetailsImage extends StatelessWidget {
  final String tagHero;
  final String imageLink;
  const ItemsDetailsImage({
    super.key,
    required this.tagHero,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: BoxDecoration(color: MyColor.themeBlackColor),
        ),
        Hero(
          tag: tagHero,
          child: CachedNetworkImage(imageUrl: imageLink),
        ),
      ],
    );
  }
}
