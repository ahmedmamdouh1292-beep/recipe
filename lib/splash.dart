import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/spalsh/Dark Overlay for Contrast (Glassmorphism effect).png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            // right:0,
            // left: 0,
            // bottom: 0,
            // top: 0
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/spalsh/RecipeHub Logo.png'),
                  ),
                  CustomText(
                    text: 'RecipeHub',
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4),
                  CustomText(
                    text: 'CULINARY INSPIRATION',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 55,

            child: Column(
              children: [
                LoadingAnimationWidget.progressiveDots(
                  color: Colors.green,
                  size: 50,
                ),
                SizedBox(height: 4),
                CustomText(
                  text: 'Preparing your kitchen...',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
