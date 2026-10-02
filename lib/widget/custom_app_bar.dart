import 'package:flutter/material.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class CutomAppbar extends StatelessWidget {
  const CutomAppbar({
    super.key,
    required this.prefixIcon,
    required this.sufixIcon,
  });
  final IconData prefixIcon;
  final IconData sufixIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(prefixIcon, size: 32),
        const SizedBox(width: 16),
        CustomText(text: 'ResipeHub', fontSize: 24),
        Spacer(flex: 1),
        Icon(sufixIcon),
      ],
    );
  }
}
