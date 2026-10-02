import 'package:flutter/material.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class CustomSearchFeild extends StatelessWidget {
  const CustomSearchFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        isDense: false,
        prefixIcon: Icon(Icons.search),
        hint: CustomText(
          text: 'Search,recpies,chaifs...',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        // enabledBorder: OutlineInputBorder(
        //      bo
        // )
      ),
    );
  }
}
