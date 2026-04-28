import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaintingDemo extends StatefulWidget {
  const PaintingDemo({super.key});

  @override
  State<PaintingDemo> createState() => _PaintingDemoState();
}

class _PaintingDemoState extends State<PaintingDemo> {
  double v1 = 0.2;
  double v2 = 0.8;
  double v3 = 0.3;
  double v4 = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: CustomPaint(
                size: const Size(300, 200),
                painter: MyPainter(v1, v2, v3, v4),
              ),
            ),

            const SizedBox(height: 30),

            buildSlider(v1, Colors.blue, Colors.red, (val) {
              setState(() => v1 = val);
            }),

            const SizedBox(height: 15),

            buildSlider(v2, Colors.green, Colors.orange, (val) {
              setState(() => v2 = val);
            }),

            const SizedBox(height: 15),

            buildSlider(v3, Colors.purple, Colors.yellow, (val) {
              setState(() => v3 = val);
            }),

            const SizedBox(height: 15),

            buildSlider(v4, Colors.black, Colors.cyan, (val) {
              setState(() => v4 = val);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildSlider(
    double value,
    Color barColor,
    Color thumbColor,
    ValueChanged<double> onChanged,
  ) {
    return SizedBox(
      width: 300,
      child: ProgressBar(
        value: value,
        barColor: barColor,
        thumbColor: thumbColor,
        onChanged: onChanged,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double v1, v2, v3, v4;

  MyPainter(this.v1, this.v2, this.v3, this.v4);

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(50, 50);
    final end = Offset(size.width - 50, size.height - 50);

    final control1 = Offset(v1 * size.width, v2 * size.height);
    final control2 = Offset(v3 * size.width, v4 * size.height);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..cubicTo(
        control1.dx,
        control1.dy,
        control2.dx,
        control2.dy,
        end.dx,
        end.dy,
      );

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawPath(path, paint);

    // helper lines
    final helperPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    canvas.drawLine(start, control1, helperPaint);
    canvas.drawLine(end, control2, helperPaint);

    final pointPaint = Paint()..color = Colors.red;
    canvas.drawCircle(control1, 5, pointPaint);
    canvas.drawCircle(control2, 5, pointPaint);
  }

  @override
  bool shouldRepaint(covariant MyPainter old) {
    return v1 != old.v1 ||
        v2 != old.v2 ||
        v3 != old.v3 ||
        v4 != old.v4;
  }
}

class ProgressBar extends LeafRenderObjectWidget {
  const ProgressBar({
    super.key,
    required this.value,
    required this.barColor,
    required this.thumbColor,
    this.thumbSize = 20.0,
    required this.onChanged,
  });

  final double value;
  final Color barColor;
  final Color thumbColor;
  final double thumbSize;
  final ValueChanged<double> onChanged;

  @override
  RenderProgressBar createRenderObject(BuildContext context) {
    return RenderProgressBar(
      value: value,
      barColor: barColor,
      thumbColor: thumbColor,
      thumbSize: thumbSize,
      onChanged: onChanged,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderProgressBar renderObject) {
    renderObject
      ..value = value
      ..barColor = barColor
      ..thumbColor = thumbColor
      ..thumbSize = thumbSize
      ..onChanged = onChanged;
  }
}

class RenderProgressBar extends RenderBox {
  RenderProgressBar({
    required double value,
    required Color barColor,
    required Color thumbColor,
    required double thumbSize,
    required ValueChanged<double> onChanged,
  })  : _currentThumbValue = value,
        _barColor = barColor,
        _thumbColor = thumbColor,
        _thumbSize = thumbSize,
        _onChanged = onChanged {
    _drag = HorizontalDragGestureRecognizer()
    ..onStart = (DragStartDetails details) {
      _updateThumbPosition(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updateThumbPosition(details.localPosition);
        };
    }

  double _currentThumbValue;

  late ValueChanged<double> _onChanged;

  ValueChanged<double> get onChanged => _onChanged;

  set onChanged(ValueChanged<double> value) {
    _onChanged = value;
  }

  set value(double newValue) {
    if (_currentThumbValue == newValue) return;
    _currentThumbValue = newValue;
    markNeedsPaint();
  }

  void _updateThumbPosition(Offset localPosition) {
    final dx = localPosition.dx.clamp(0, size.width);
    _currentThumbValue = dx / size.width;

    _onChanged(_currentThumbValue);

    markNeedsPaint();
  }

  Color _barColor;
  Color _thumbColor;
  double _thumbSize;

  set barColor(Color value) {
    if (_barColor == value) return;
    _barColor = value;
    markNeedsPaint();
  }

  set thumbColor(Color value) {
    if (_thumbColor == value) return;
    _thumbColor = value;
    markNeedsPaint();
  }

  set thumbSize(double value) {
    if (_thumbSize == value) return;
    _thumbSize = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(constraints.maxWidth, _thumbSize));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    final barPaint = Paint()
      ..color = _barColor
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      barPaint,
    );

    final thumbPaint = Paint()..color = _thumbColor;

    final thumbDx = _currentThumbValue * size.width;

    canvas.drawCircle(
      Offset(thumbDx, size.height / 2),
      _thumbSize / 2,
      thumbPaint,
    );

    canvas.restore();
  }

  late HorizontalDragGestureRecognizer _drag;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent) {
      _drag.addPointer(event);
    }
  }
}