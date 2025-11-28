import 'package:flutter/material.dart';

class DraggableArea extends StatefulWidget {
  const DraggableArea({
    super.key,
    required this.child,
    required this.draggable,
    required this.size,
    this.initialAlignment = Alignment.bottomRight,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final PreferredSizeWidget draggable;
  final Size size;
  final Alignment initialAlignment;
  final EdgeInsets padding;

  @override
  State<DraggableArea> createState() => _DraggableArea();
}

class _DraggableArea extends State<DraggableArea> with SingleTickerProviderStateMixin {
  double get _availableWidth => widget.size.width - widget.draggable.preferredSize.width - widget.padding.horizontal;
  double get _availableHeight => widget.size.height - widget.draggable.preferredSize.height - widget.padding.vertical;

  late Alignment _alignment = widget.initialAlignment;
  late Offset _position = _calculatePosition();

  late final AnimationController _animationController;
  Animatable<Offset>? _positionTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(_onAnimationControllerUpdated);
  }

  @override
  void didUpdateWidget(covariant DraggableArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.size != oldWidget.size ||
        widget.draggable.preferredSize != oldWidget.draggable.preferredSize ||
        widget.padding != oldWidget.padding) {
      _alignDraggable();
    }
  }

  Offset _calculatePosition() {
    return Offset(
      (_alignment.x + 1) / 2 * _availableWidth + widget.padding.left,
      (_alignment.y + 1) / 2 * _availableHeight + widget.padding.top,
    );
  }

  void _onPanStart() {
    _animationController.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() => _position += details.delta);
  }

  void _onPanRelease(DragEndDetails details) {
    final horCorrection = details.velocity.pixelsPerSecond.dx * 0.1;
    final verCorrection = details.velocity.pixelsPerSecond.dy * 0.1;
    _alignDraggable(
      horCorrection: horCorrection,
      verCorrection: verCorrection,
    );
  }

  void _alignDraggable({
    double horCorrection = 0,
    double verCorrection = 0,
  }) {
    final correctedOffset = Offset(
      _position.dx + horCorrection - widget.padding.left,
      _position.dy + verCorrection - widget.padding.top,
    );
    _alignment = Alignment(
      (correctedOffset.dx / _availableWidth).round().clamp(0, 1) * 2 - 1,
      (correctedOffset.dy / _availableHeight).round().clamp(0, 1) * 2 - 1,
    );
    _positionTween = Tween(begin: _position, end: _calculatePosition()).chain(
      CurveTween(curve: Curves.bounceIn),
    );

    _animationController.forward(from: 0);
  }

  void _onAnimationControllerUpdated() {
    final positionTween = _positionTween;
    if (positionTween == null) {
      return;
    }
    setState(() => _position = positionTween.evaluate(_animationController));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
          Positioned(
            left: _position.dx,
            top: _position.dy,
            child: GestureDetector(
              onPanStart: (_) => _onPanStart(),
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanRelease,
              child: widget.draggable,
            ),
          ),
      ],
    );
  }
}
