part of '../ui_kit.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  const CustomTextButton({
    super.key,
    required this.text,
    this.isDisabled = false,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading || isDisabled ? null : onPressed,
      child: Text(text),
    );
  }
}
