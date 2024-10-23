part of '../home.dart';

class TextQRCode extends StatelessWidget {
  final TextDTO qrCodeInfo;
  const TextQRCode({
    super.key,
    required this.qrCodeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        SizedBox(
          width: double.infinity,
          child: CustomFilledButton(
            text: context.localization.close,
            onPressed: () => context.router.maybePop(),
          ),
        )
      ],
      content: SizedBox(
        width: context.deviceWidth,
        height: context.deviceHeight / 3,
        child: Center(
          child: QrImageView(
            data: jsonEncode(qrCodeInfo.toJson()),
            gapless: true,
          ),
        ),
      ),
    );
  }
}
