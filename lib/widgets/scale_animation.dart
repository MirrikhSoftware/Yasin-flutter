/*

  Created by: Bakhromjon Polat
  Created on: Jan 03 2024 06:42:28
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration duration;
  final double scaleValue;
  final bool isDisabled;
  final VoidCallback? onLongPressed;

  const ScaleAnimation({
    required this.child,
    required this.onTap,
    super.key,
    this.isDisabled = false,
    this.duration = const Duration(milliseconds: 150),
    this.scaleValue = 0.95,
    this.onLongPressed,
  }) : assert(scaleValue <= 1 && scaleValue >= 0,
            'Range error: Range should be between [0,1]');

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: widget.scaleValue,
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onLongPress: widget.onLongPressed,
        onTap: () {
          if (!widget.isDisabled) {
            widget.onTap?.call();
          }
        },
        onPanDown: (details) {
          if (!widget.isDisabled) {
            _controller.forward();
          }
        },
        onPanCancel: () {
          if (!widget.isDisabled) {
            _controller.reverse();
          }
        },
        onPanEnd: (details) {
          if (!widget.isDisabled) {
            _controller.reverse();
          }
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      );
}
