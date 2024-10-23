part of '../qr_scanner.dart';

class CornerBorderPainter extends CustomPainter {
  final Color color;

  CornerBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(0, 0), const Offset(50, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, 50), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - 50, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, 50), paint);
    canvas.drawLine(Offset(0, size.height), Offset(50, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - 50), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - 50, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - 50), paint);
  }

  @override
  bool shouldRepaint(CornerBorderPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
