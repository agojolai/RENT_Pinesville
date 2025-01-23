import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/utils/constants/colors.dart';

class PAnimationLoaderWidget extends StatelessWidget {
  const PAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.asset(animation,
          width: MediaQuery.of(context).size.width *
              0.8), //display lottie animation
      SizedBox(height: 16),
      Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          color: PColors.Pteal
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 16),
      showAction
          ? SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: PColors.Pteal),
                child: Text(
                  actionText!,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: PColors.Pteal
                  ),
                ),
              ))
          : SizedBox(),
    ]));
  }
}
