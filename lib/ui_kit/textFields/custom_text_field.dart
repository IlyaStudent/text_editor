part of '../ui_kit.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool hideable;
  final String? errorText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.hideable = false,
    this.hintText,
    this.onChanged,
    this.errorText,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
        helperText: "",
        errorText: widget.errorText,
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.hideable
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
