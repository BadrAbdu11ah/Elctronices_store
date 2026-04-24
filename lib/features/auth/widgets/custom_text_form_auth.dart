import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.valid,
    this.isNumber = false,
    this.obscureText = false,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 13.5),
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(labelText),
          ),
          floatingLabelBehavior:
              FloatingLabelBehavior.always, //always: الليبل ثابت
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
