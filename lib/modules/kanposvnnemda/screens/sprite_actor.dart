import 'dart:async';
import 'package:flutter/material.dart';

enum FighterAnimation { idle, walk, run, aim, shoot, hit, fall, dead }

class SpriteActor extends StatefulWidget {
  const SpriteActor({super.key, required this.character, required this.animation, this.size = 150, this.flipX = false});
  final String character;
  final FighterAnimation animation;
  final double size;
  final bool flipX;

  @override
  State<SpriteActor> createState() => _SpriteActorState();
}

class _SpriteActorState extends State<SpriteActor> {
  Timer? _timer;
  int _frame = 0;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void didUpdateWidget(covariant SpriteActor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animation != widget.animation || oldWidget.character != widget.character) {
      _frame = 0;
      _start();
    }
  }

  void _start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 105), (_) {
      if (!mounted) return;
      setState(() => _frame = (_frame + 1) % 4);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _path {
    final c = widget.character.toLowerCase();
    final a = widget.animation.name;
    final n = _frame.toString().padLeft(3, '0');
    return 'assets/sprites/$c/$a/${c}_${a}_$n.png';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(widget.flipX ? -1.0 : 1.0, 1.0),
        child: Image.asset(
          _path,
          gaplessPlayback: true,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
