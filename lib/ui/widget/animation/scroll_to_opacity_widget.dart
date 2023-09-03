import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToOpacityWidget extends StatefulWidget {
  const ScrollToOpacityWidget({
    Key? key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  @override
  State<ScrollToOpacityWidget> createState() => _ScrollToOpacityWidgetState();
}

class _ScrollToOpacityWidgetState extends State<ScrollToOpacityWidget> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      setState((){
        opacity = 1.0;

      });
    }
    if (direction == ScrollDirection.reverse) {
      setState((){
        opacity = 0.4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: widget.duration,
      child: widget.child,
    );
  }
}