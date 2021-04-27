import 'package:flutter/material.dart';

class TFSLogo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.5000000, 0);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.2498400);
    path_0.lineTo(size.width * 0.2501450, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.7501600);
    path_0.lineTo(size.width * 0.5000000, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff348cbc).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4936100, size.height * 0.3333300);
    path_1.lineTo(size.width * 0.5625000, size.height * 0.4999950);
    path_1.lineTo(size.width * 0.4936100, size.height * 0.6666600);
    path_1.lineTo(size.width * 0.6458300, size.height * 0.4999950);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff74ace4).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.7716500, size.height * 0.2277750);
    path_2.lineTo(size.width * 0.8749850, size.height * 0.4986100);
    path_2.lineTo(size.width * 0.7716500, size.height * 0.7694450);
    path_2.lineTo(size.width * 0.9999850, size.height * 0.4986100);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff0e3d69).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.6222000, size.height * 0.2916650);
    path_3.lineTo(size.width * 0.7083100, size.height * 0.5000000);
    path_3.lineTo(size.width * 0.6222000, size.height * 0.7083350);
    path_3.lineTo(size.width * 0.8124800, size.height * 0.5000000);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xffffde2f).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
