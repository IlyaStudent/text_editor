part of '../qr_scanner.dart';

@RoutePage()
class QRScannerPage extends StatelessWidget implements AutoRouteWrapper {
  const QRScannerPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => QrScannerCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QrScannerCubit>().state;
    state.when(
      scanning: () {},
      detected: (TextEntity textEntity) {
        context.router.push(
          TextRoute(
            textEntity: textEntity,
          ),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localization.qrScanner,
        ),
      ),
      body: MobileScanner(
        overlayBuilder: (context, constraints) => CustomPaint(
          size: Size(context.deviceWidth - 100, context.deviceWidth - 100),
          painter: CornerBorderPainter(color: context.colorScheme.primary),
        ),
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) => context.qrScannerCubit.showDetectedText(capture),
      ),
    );
  }
}
