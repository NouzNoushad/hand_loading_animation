import 'package:flutter/material.dart';

const Color backgroundColor = Colors.blue;
const Color primaryColor = Colors.white;

class HandLoadingScreen extends StatefulWidget {
  const HandLoadingScreen({super.key});

  @override
  State<HandLoadingScreen> createState() => _HandLoadingScreenState();
}

class _HandLoadingScreenState extends State<HandLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> littleFingerAnimation;
  late Animation<double> ringFingerAnimation;
  late Animation<double> middleFingerAnimation;
  late Animation<double> foreFingerAnimation;

  late Animation<double> littleFingerNailAnimation;
  late Animation<double> ringFingerNailAnimation;
  late Animation<double> middleFingerNailAnimation;
  late Animation<double> foreFingerNailAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    littleFingerAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 0.4), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.4, end: 0.5), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 1)));

    littleFingerNailAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 8.0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 8.0, end: 0.0), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 1)));

    ringFingerAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 0.4), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.4, end: 0.5), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.2, 1)));

    ringFingerNailAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 8.0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 8.0, end: 0.0), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.2, 1)));

    middleFingerAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 0.4), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.4, end: 0.5), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.3, 1)));

    middleFingerNailAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 8.0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 8.0, end: 0.0), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.3, 1)));

    foreFingerAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 0.4), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.4, end: 0.5), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.4, 1)));

    foreFingerNailAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 8.0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 8.0, end: 0.0), weight: 1),
    ]).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.4, 1)));

    controller.forward();
    controller.addListener(() {
      controller.repeat();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Center(
              child: Container(
                height: size.height * 0.4,
                width: size.width * 0.8,
                color: Colors.transparent,
                child: CustomPaint(
                  painter: HandPainter(
                    littleFingerHeight: littleFingerAnimation.value,
                    littleFingerNailHeight: littleFingerNailAnimation.value,
                    ringFingerHeight: ringFingerAnimation.value,
                    ringFingerNailHeight: ringFingerNailAnimation.value,
                    middleFingerHeight: middleFingerAnimation.value,
                    middleFingerNailHeight: middleFingerNailAnimation.value,
                    foreFingerHeight: foreFingerAnimation.value,
                    foreFingerNailHeight: foreFingerNailAnimation.value,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HandPainter extends CustomPainter {
  HandPainter({
    required this.littleFingerHeight,
    required this.littleFingerNailHeight,
    required this.ringFingerHeight,
    required this.ringFingerNailHeight,
    required this.middleFingerHeight,
    required this.middleFingerNailHeight,
    required this.foreFingerHeight,
    required this.foreFingerNailHeight,
  });
  final double littleFingerHeight;
  final double ringFingerHeight;
  final double middleFingerHeight;
  final double foreFingerHeight;

  final double littleFingerNailHeight;
  final double ringFingerNailHeight;
  final double middleFingerNailHeight;
  final double foreFingerNailHeight;

  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white;

    double fingerXPosition = w * 0.28;
    double fingerYPosition = h * 0.5;
    double fingerWidth = w * 0.1;
    double fingerHeight = h * 0.3;

    drawFinger(fingerXPosition, fingerYPosition, fingerWidth, fingerHeight) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(fingerXPosition, fingerYPosition),
                  width: fingerWidth,
                  height: fingerHeight),
              const Radius.circular(10)),
          Paint()..color = primaryColor);
    }

    drawFingerNail(
        fingerXPosition, fingerYPosition, fingerWidth, fingerHeight) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(fingerXPosition,
                      fingerYPosition + fingerHeight * 0.5 - 15),
                  width: fingerWidth - 10,
                  height: fingerWidth - 10),
              const Radius.circular(6)),
          Paint()..color = backgroundColor);
    }

    drawFingerLines(
        fingerXPosition, fingerYPosition, fingerWidth, fingerHeight) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(fingerXPosition,
                      fingerYPosition - fingerHeight * 0.5 + 10),
                  width: fingerWidth * 0.5,
                  height: h * 0.012),
              const Radius.circular(0)),
          Paint()..color = backgroundColor);
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(fingerXPosition,
                      fingerYPosition - fingerHeight * 0.5 + 16),
                  width: fingerWidth * 0.5,
                  height: h * 0.012),
              const Radius.circular(0)),
          Paint()..color = backgroundColor);
    }

    // litter finger
    fingerYPosition = h * littleFingerHeight;
    drawFinger(fingerXPosition, fingerYPosition, fingerWidth, fingerHeight);
    drawFingerNail(fingerXPosition, fingerYPosition - littleFingerNailHeight,
        fingerWidth, fingerHeight);
    drawFingerLines(fingerXPosition, fingerYPosition - littleFingerNailHeight,
        fingerWidth, fingerHeight);

    // ring finger
    fingerYPosition = h * ringFingerHeight;
    fingerXPosition = fingerXPosition + fingerWidth + 3;
    fingerHeight = h * 0.38;
    drawFinger(fingerXPosition, fingerYPosition, fingerWidth, fingerHeight);
    drawFingerNail(fingerXPosition, fingerYPosition - ringFingerNailHeight,
        fingerWidth, fingerHeight);
    drawFingerLines(fingerXPosition, fingerYPosition - ringFingerNailHeight,
        fingerWidth, fingerHeight);

    // middle finger
    fingerYPosition = h * middleFingerHeight;
    fingerXPosition = fingerXPosition + fingerWidth + 3;
    fingerHeight = h * 0.42;
    drawFinger(fingerXPosition, fingerYPosition, fingerWidth, fingerHeight);
    drawFingerNail(fingerXPosition, fingerYPosition - middleFingerNailHeight,
        fingerWidth, fingerHeight);
    drawFingerLines(fingerXPosition, fingerYPosition - middleFingerNailHeight,
        fingerWidth, fingerHeight);

    // fore finger
    fingerYPosition = h * foreFingerHeight;
    fingerXPosition = fingerXPosition + fingerWidth + 3;
    fingerHeight = h * 0.35;
    drawFinger(fingerXPosition, fingerYPosition, fingerWidth, fingerHeight);
    drawFingerNail(fingerXPosition, fingerYPosition - foreFingerNailHeight,
        fingerWidth, fingerHeight);
    drawFingerLines(fingerXPosition, fingerYPosition - foreFingerNailHeight,
        fingerWidth, fingerHeight);

    // thump
    fingerXPosition = fingerXPosition + fingerWidth * 0.6;
    canvas.drawPath(
        Path()
          ..moveTo(fingerXPosition, h * 0.57)
          ..quadraticBezierTo(
              fingerXPosition + 40, h * 0.58, fingerXPosition + 42, h * 0.45)
          ..quadraticBezierTo(
              fingerXPosition + 40, h * 0.42, fingerXPosition + 25, h * 0.43)
          ..quadraticBezierTo(
              fingerXPosition, h * 0.45, fingerXPosition, h * 0.4)
          ..close(),
        Paint()..color = primaryColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
