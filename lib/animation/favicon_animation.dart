import 'package:flutter/material.dart';

class AnimatedFavoriteIcon extends StatefulWidget {
  final bool isFav;

  const AnimatedFavoriteIcon({required this.isFav});

  @override
  State<AnimatedFavoriteIcon> createState() => _AnimatedFavoriteIconState();
}

class _AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // ..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.5, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Icon(
        widget.isFav ? Icons.favorite : Icons.favorite_border_outlined,
        key: ValueKey(widget.isFav),
      ),
    );
  }
}
