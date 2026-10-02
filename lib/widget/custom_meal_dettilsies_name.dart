import 'package:flutter/material.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class CustomMealDetilesName extends StatelessWidget {
  const CustomMealDetilesName({super.key, required this.name, required this.url});
  final String name;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: CustomText(text: name, fontSize: 28,maxLines: 100,)),
        Spacer(flex: 1),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.green[100],
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Icon(Icons.play_circle, color: Colors.red),
                CustomText(text: 'YouTube', fontSize: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
