part of '../../qr_scanner.dart';

@freezed
class QrScannerState with _$QrScannerState {
  const factory QrScannerState.scanning() = _ScanningState;
  const factory QrScannerState.detected({
    required UnencryptedTextEntity unencryptedTextEntity,
  }) = _DetectedState;
}
