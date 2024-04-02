import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatefulWidget {
  const SlidingText({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.textStyle = AppTextStyle.textStyle16,
    this.isRigth = false,
    this.isLeft = false,
  });

  final String text;
  final Color textColor;
  final TextStyle textStyle;
  final bool isRigth;
  final bool isLeft;

  @override
  State<SlidingText> createState() => _SlidingTextState();
}

class _SlidingTextState extends State<SlidingText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: widget.textStyle.copyWith(color: widget.textColor),
            ),
          );
        });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Offset begin;

    if (widget.isLeft) {
      begin = const Offset(1, 0);
    } else {
      begin = const Offset(-1, 0);
    }

    slidingAnimation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
