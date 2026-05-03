import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:electronics_store/features/home/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataModel.length,
      shrinkWrap: true, // لتجنب تعارض الارتفاع داخل ListView الأب
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        return InkWell(
          onTap: () {
            controller.goToItemsDetails(listDataModel[i]);
          },
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 900),
                    height: 90,
                    padding: const EdgeInsets.all(8),
                    child: CachedNetworkImage(
                      imageUrl: listDataModel[i].itemsImage!,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                // تفاصيل المنتج (الاسم، القسم، السعر)
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                      listDataModel[i].itemsName!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${listDataModel[i].category?.categoriesName}"),
                        const SizedBox(height: 5),
                        // عرض السعر بعد الخصم إذا وجد
                        Text(
                          "${listDataModel[i].discountedPrice ?? listDataModel[i].itemsPrice} ر.س",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
