import 'package:flutter/material.dart';

class SwipeAnimation extends StatefulWidget {
  const SwipeAnimation({
    super.key,
    required this.next,
    required this.previous,
    required this.child,
  });

  final void Function() next;
  final void Function() previous;
  final Widget child;

  @override
  State<SwipeAnimation> createState() => _SwipeAnimationState();
}

class _SwipeAnimationState extends State<SwipeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isSwipingLeft = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(_controller);

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      // Swiped right, go to previous song
      _isSwipingLeft = false;
      _updateAnimations();
      _controller.forward(from: 0).then((_) {
        widget.previous();
        _controller.reset();
      });
    } else if (details.primaryVelocity! < 0) {
      // Swiped left, go to next song
      _isSwipingLeft = true;
      _updateAnimations();
      _controller.forward(from: 0).then((_) {
        widget.next();
        _controller.reset();
      });
    }
  }

  void _updateAnimations() {
    _slideAnimation = Tween<Offset>(
      begin: _isSwipingLeft ? const Offset(1, 0) : const Offset(-1, 0),
      end: Offset.zero,
    ).animate(_controller);
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: _handleDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              widget.child,
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: widget.child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
