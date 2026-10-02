import 'package:flutter/material.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.name1, required this.name2});
   final String name1 ;
   final String name2 ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: name1, fontSize: 20),
        Spacer(flex: 1),
        CustomText(text: name2, fontSize: 16, fontWeight: FontWeight.w400),
      ],
    );
  }
}
