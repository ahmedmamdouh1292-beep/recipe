import 'package:flutter/material.dart';
import 'package:recipy_hub/screens/category_view.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return CategoryView( catName:categoryName , );
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12, bottom: 16),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffE2E2E5),
              ),
              child: Center(
                child: CustomText(text: categoryName, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
