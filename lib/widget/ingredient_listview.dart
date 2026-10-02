import 'package:flutter/material.dart';

class IngredientListView extends StatelessWidget {
  const IngredientListView({
    super.key,
    required this.measusre,
    required this.ingerdiant,
  });
  final List<String> measusre;
  final List<String> ingerdiant;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ingerdiant.length,
      itemBuilder: (context, index) {
        final String ing = ingerdiant[index];
        final String meag = measusre[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                 Text(
                 meag,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                
                Container(width: 1, height: 25, color: Colors.grey),
                const SizedBox(width: 8),
                 Expanded(
                  child: Text(
                   ing,
                    style: TextStyle(fontSize: 16),
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
