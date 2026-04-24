import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  final void Function() onDelete;
  final void Function() onEdit;
  final AddressModel addressModel;
  const CardAddress({
    super.key,
    required this.addressModel,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: ListTile(
          title: Text(addressModel.addressesName!),
          subtitle: Text(
            "${addressModel.addressesStreet!}, ${addressModel.addressesCity!}",
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline_rounded, color: MyColor.priceColor),
          ),
          leading: IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit_outlined, color: MyColor.themeColor),
          ),
        ),
      ),
    );
  }
}
