part of '../../qr_scanner.dart';

class QrScannerCubit extends Cubit<QrScannerState> {
  QrScannerCubit() : super(const QrScannerState.scanning());

  Future<void> showDetectedText(BarcodeCapture capture) async {
    for (final barcode in capture.barcodes) {
      log(barcode.rawValue ?? StringConsts.emptyString);
      // try {
      final TextEntity textEntity = TextDTO.fromJson(
          jsonDecode(barcode.rawValue ?? StringConsts.emptyString));
      log("Correct qr code - ${textEntity.textTitle ?? StringConsts.emptyString}");
      emit(
        QrScannerState.detected(textEntity: textEntity),
      );
      // } catch (e) {
      //   log("Inccorect qr code - ${barcode.rawValue}");
      // }
    }
  }
}

extension QrScannerCubitBuildContext on BuildContext {
  QrScannerCubit get qrScannerCubit => read();
}
