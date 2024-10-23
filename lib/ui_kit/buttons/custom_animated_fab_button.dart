part of '../ui_kit.dart';

class CustomAnimatedFabButton extends StatefulWidget {
  final VoidCallback downloadAction;
  final VoidCallback addAction;
  final VoidCallback scanAction;

  const CustomAnimatedFabButton({
    super.key,
    required this.downloadAction,
    required this.addAction,
    required this.scanAction,
  });

  @override
  State<CustomAnimatedFabButton> createState() =>
      _CustomAnimatedFabButtonState();
}

class _CustomAnimatedFabButtonState extends State<CustomAnimatedFabButton>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation1 = Tween<Offset>(
      begin: const Offset(0.0, 2.4),
      end: const Offset(0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _animation2 = Tween<Offset>(
      begin: const Offset(0.0, 1.4),
      end: const Offset(0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SlideTransition(
          position: _animation1,
          child: FloatingActionButton(
            heroTag: (Platform.isWindows)
                ? StringConsts.addButton
                : StringConsts.scanButton,
            onPressed:
                (Platform.isWindows) ? widget.addAction : widget.scanAction,
            mini: true,
            child: (Platform.isWindows)
                ? const Icon(Icons.add)
                : const Icon(Icons.qr_code_scanner_rounded),
          ),
        ),
        const SizedBox(height: 8),
        SlideTransition(
          position: _animation2,
          child: FloatingActionButton(
            heroTag: StringConsts.downloadButton,
            onPressed: widget.downloadAction,
            mini: true,
            child: const Icon(Icons.download_rounded),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            heroTag: StringConsts.toggleButton,
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _controller,
            ),
          ),
        ),
      ],
    );
  }
}
