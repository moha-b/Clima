import 'package:flutter/material.dart';

class FadeSlideAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const FadeSlideAnimation({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double animValue = controller.value * 2;
          animValue = (animValue.clamp(0.0, 1.0) * 2 - 1).abs();

          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
              ),
            ),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.5),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: controller,
                  curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
                ),
              ),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
