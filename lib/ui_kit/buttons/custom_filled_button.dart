part of '../ui_kit.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  const CustomFilledButton(
      {super.key,
      required this.text,
      this.isDisabled = false,
      this.isLoading = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: isDisabled || isLoading ? null : onPressed,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.white),
          backgroundColor: WidgetStateProperty.all(
            isDisabled
                ? context.colorScheme.secondary
                : context.colorScheme.primary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: isLoading
              ? CircularProgressIndicator(
                  color: context.colorScheme.onPrimary,
                )
              : Text(
                  text,
                ),
        ));
  }
}
