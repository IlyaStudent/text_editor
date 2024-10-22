part of '../home.dart';

class TextQRCode extends StatelessWidget {
  final TextDTO qrCodeInfo;
  final VoidCallback closeAction;
  const TextQRCode({
    super.key,
    required this.qrCodeInfo,
    required this.closeAction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text(
      //   qrCodeInfo.textTitle ?? StringConsts.emptyString,
      //   textAlign: TextAlign.center,
      // ),
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
            data: qrCodeInfo.toJson().toString(),
            gapless: true,
          ),
        ),
      ),
    );
  }
}
