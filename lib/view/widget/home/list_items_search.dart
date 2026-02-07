import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_store/controller/home/home_page_controller.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataModel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        return InkWell(
          onTap: () {
            controller.goToItemsDetails(listDataModel[i]);
          },
          child: Card(
            child: Row(
              children: [
                Expanded(
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
                          imageUrl: listDataModel[i].itemsImage!,
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.broken_image),
                        ),
                      ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                      listDataModel[i].itemsName!,
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      "${listDataModel[i].category!.categoriesName}",
                      style: TextStyle(fontSize: 16),
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
