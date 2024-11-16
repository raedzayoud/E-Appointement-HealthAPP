import 'package:flutter/material.dart';

class Customtextformfieldsearch extends StatelessWidget {
  final String hintText;
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  final IconData iconData;
  const Customtextformfieldsearch(
      {super.key,
      required this.hintText,
      this.onPressed,
      this.validator,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(iconData),
          ),
          fillColor: Colors.grey[300],
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: validator);
  }
}
