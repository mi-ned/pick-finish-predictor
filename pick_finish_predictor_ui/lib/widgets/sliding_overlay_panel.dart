import 'package:flutter/material.dart';

class SlidingOverlayPanel extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onClose;
  final Widget child;
  final double heightFactor;

  const SlidingOverlayPanel({
    super.key,
    required this.isVisible,
    required this.onClose,
    required this.child,
    this.heightFactor = 0.85,
  });

  @override
  State<SlidingOverlayPanel> createState() => _SlidingOverlayPanelState();
}

class _SlidingOverlayPanelState extends State<SlidingOverlayPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Drives the panel down from off-screen top (0, -1) to top edge (0, 0)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Drives the dark backdrop fade in and out
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Initial state check
    if (widget.isVisible) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant SlidingOverlayPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      widget.isVisible ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final panelHeight = MediaQuery.of(context).size.height * widget.heightFactor;
    
    return IgnorePointer(
    ignoring: !widget.isVisible,
    child: Stack(
      children: [
        // 1. Dark overlay (fades in/out and taps to close)
        Positioned.fill(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: IgnorePointer(
              ignoring: !widget.isVisible,
              child: GestureDetector(
                onTap: widget.onClose,
                child: Container(
                  color: Colors.black.withOpacity(0.45),
                ),
              ),
            ),
          ),
        ),

        // 2. Sliding content panel
        Align(
          alignment: Alignment.topCenter,
          child: SlideTransition(
            position: _slideAnimation,
            child: SizedBox(
              height: panelHeight,
              width: double.infinity,
              child: widget.child,
            ),
          ),
        ),
      ],
    ),
    );
  }
}