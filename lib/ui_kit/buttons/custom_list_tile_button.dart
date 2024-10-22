part of '../ui_kit.dart';

class CustomListTileButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String titleText;
  final IconData trailingIcon;
  const CustomListTileButton({
    super.key,
    this.onTap,
    required this.titleText,
    this.trailingIcon = Icons.arrow_forward_ios,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        minVerticalPadding: 16,
        title: Text(titleText),
        trailing: Icon(
          trailingIcon,
        ),
      ),
    );
  }
}
