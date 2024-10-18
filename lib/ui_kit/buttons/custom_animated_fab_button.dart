part of '../ui_kit.dart';

class CustomAnimatedFabButton extends StatefulWidget {
  final VoidCallback downloadAction;
  final VoidCallback addAction;
  const CustomAnimatedFabButton(
      {super.key, required this.downloadAction, required this.addAction});

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
      begin: const Offset(0.0, 1.0),
      end: const Offset(0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _animation2 = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
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
        if (_isExpanded)
          SlideTransition(
            position: _animation1,
            child: FloatingActionButton(
              onPressed: widget.addAction,
              mini: true,
              child: const Icon(Icons.add),
            ),
          ),
        if (_isExpanded)
          SlideTransition(
            position: _animation2,
            child: FloatingActionButton(
              onPressed: widget.downloadAction,
              mini: true,
              child: const Icon(Icons.download_rounded),
            ),
          ),
        FloatingActionButton(
          onPressed: _toggle,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
        ),
      ],
    );
  }
}