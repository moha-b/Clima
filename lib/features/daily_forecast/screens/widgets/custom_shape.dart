import 'package:flutter/material.dart';

class CustomShape extends CustomPainter {
  final BuildContext context;
  CustomShape({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2142661, size.height * 0.05116200);
    path_0.lineTo(size.width * 0.8996433, size.height * 0.3605606);
    path_0.cubicTo(
        size.width * 0.9236257,
        size.height * 0.3713869,
        size.width * 0.9413567,
        size.height * 0.3794011,
        size.width * 0.9548538,
        size.height * 0.3889480);
    path_0.cubicTo(
        size.width * 0.9682807,
        size.height * 0.3984429,
        size.width * 0.9772018,
        size.height * 0.4092463,
        size.width * 0.9837310,
        size.height * 0.4252891);
    path_0.cubicTo(
        size.width * 0.9902573,
        size.height * 0.4413320,
        size.width * 0.9936374,
        size.height * 0.4607503,
        size.width * 0.9953480,
        size.height * 0.4884497);
    path_0.cubicTo(
        size.width * 0.9970702,
        size.height * 0.5163029,
        size.width * 0.9970760,
        size.height * 0.5518691,
        size.width * 0.9970760,
        size.height * 0.5999714);
    path_0.lineTo(size.width * 0.9970760, size.height * 0.7485714);
    path_0.cubicTo(
        size.width * 0.9970760,
        size.height * 0.8079943,
        size.width * 0.9970702,
        size.height * 0.8519886,
        size.width * 0.9947456,
        size.height * 0.8857543);
    path_0.cubicTo(
        size.width * 0.9924357,
        size.height * 0.9193543,
        size.width * 0.9878772,
        size.height * 0.9419657,
        size.width * 0.9790906,
        size.height * 0.9591371);
    path_0.cubicTo(
        size.width * 0.9703041,
        size.height * 0.9763086,
        size.width * 0.9587339,
        size.height * 0.9852171,
        size.width * 0.9415409,
        size.height * 0.9897314);
    path_0.cubicTo(
        size.width * 0.9242632,
        size.height * 0.9942743,
        size.width * 0.9017515,
        size.height * 0.9942857,
        size.width * 0.8713450,
        size.height * 0.9942857);
    path_0.lineTo(size.width * 0.1286550, size.height * 0.9942857);
    path_0.cubicTo(
        size.width * 0.09824795,
        size.height * 0.9942857,
        size.width * 0.07573684,
        size.height * 0.9942743,
        size.width * 0.05845994,
        size.height * 0.9897314);
    path_0.cubicTo(
        size.width * 0.04126667,
        size.height * 0.9852171,
        size.width * 0.02969532,
        size.height * 0.9763086,
        size.width * 0.02090865,
        size.height * 0.9591371);
    path_0.cubicTo(
        size.width * 0.01212193,
        size.height * 0.9419657,
        size.width * 0.007564591,
        size.height * 0.9193543,
        size.width * 0.005253041,
        size.height * 0.8857543);
    path_0.cubicTo(
        size.width * 0.002930175,
        size.height * 0.8519886,
        size.width * 0.002923977,
        size.height * 0.8079943,
        size.width * 0.002923977,
        size.height * 0.7485714);
    path_0.lineTo(size.width * 0.002923977, size.height * 0.3796549);
    path_0.cubicTo(
        size.width * 0.002923977,
        size.height * 0.2800640,
        size.width * 0.002931199,
        size.height * 0.2059960,
        size.width * 0.007033684,
        size.height * 0.1503589);
    path_0.cubicTo(
        size.width * 0.01112506,
        size.height * 0.09487314,
        size.width * 0.01921737,
        size.height * 0.05885086,
        size.width * 0.03493684,
        size.height * 0.03441760);
    path_0.cubicTo(
        size.width * 0.05065643,
        size.height * 0.009984400,
        size.width * 0.07043743,
        size.height * 0.002682931,
        size.width * 0.09902164,
        size.height * 0.007380457);
    path_0.cubicTo(
        size.width * 0.1276836,
        size.height * 0.01209074,
        size.width * 0.1646135,
        size.height * 0.02874737,
        size.width * 0.2142661,
        size.height * 0.05116200);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.005847953;
    paint_0_stroke.color = Theme.of(context).cardColor;
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Theme.of(context).focusColor;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
