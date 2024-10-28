part of '../../qr_scanner.dart';

class QrScannerCubit extends Cubit<QrScannerState> {
  final SettingsRepository settingsRepository;
  final Encryptor encryptor;
  QrScannerCubit({
    required this.settingsRepository,
    required this.encryptor,
  }) : super(const QrScannerState.scanning());

  Future<void> showDetectedText(BarcodeCapture capture) async {
    for (final barcode in capture.barcodes) {
      try {
        final UnencryptedTextEntity unencryptedTextEntity =
            await settingsRepository.getBoolValue(
                    key: StringConsts.encryptionMode)
                ? await encryptor.decryptText(
                    EncryptedTextDTO.fromJson(
                      jsonDecode(barcode.rawValue ?? StringConsts.emptyString),
                    ),
                  )
                : UnencryptedTextDTO.fromJson(
                    jsonDecode(barcode.rawValue ?? StringConsts.emptyString),
                  );
        emit(
          QrScannerState.detected(unencryptedTextEntity: unencryptedTextEntity),
        );
      } catch (e) {
        // qr scan error
      }
    }
  }
}

extension QrScannerCubitBuildContext on BuildContext {
  QrScannerCubit get qrScannerCubit => read();
}
