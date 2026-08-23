import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:audioplayers/audioplayers.dart' hide PlayerMode;
import '../game/game_engine.dart';
import '../models/game_models.dart';
import '../services/settings_service.dart';
import 'sprite_actor.dart';
import 'sprite_gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.settings});
  final GameSettings settings;
  @override State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff07111d),
      body: SafeArea(
        child: Stack(children: [
          Positioned.fill(child: Image.asset('assets/images/nemda_bg_home.png', fit: BoxFit.cover)),
          Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(color: Colors.black.withOpacity(.16)))),
          Center(child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 430),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xdd06233d),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: Colors.white24, width: 1.5),
                boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 28, spreadRadius: 4)],
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('MINGMING', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.orangeAccent)),
                const Text('VS WANGTTA', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white)),
                const SizedBox(height: 18),
                _menuButton(context, 'CHƠI NHANH', Icons.flash_on, () => _openGame(context, false)),
                const SizedBox(height: 10),
                _menuButton(context, 'ĐẤU VỚI MÁY', Icons.smart_toy, () => _openGame(context, true)),
                const SizedBox(height: 10),
                _menuButton(context, '2 NGƯỜI', Icons.people, () => _openGame(context, false)),
                const SizedBox(height: 10),
                _menuButton(context, 'SPRITE ANIMATION', Icons.animation, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SpriteGalleryScreen()))),
                const SizedBox(height: 12),
                SwitchListTile(
                  dense: true,
                  title: const Text('Hiện quỹ đạo đạn'),
                  value: widget.settings.showTrajectory,
                  onChanged: (v) async { setState(() => widget.settings.showTrajectory = v); await widget.settings.save(); },
                ),
                ListTile(
                  dense: true,
                  title: const Text('Độ khó AI'),
                  trailing: DropdownButton<int>(
                    value: widget.settings.difficulty,
                    items: const [DropdownMenuItem(value: 1, child: Text('Dễ')), DropdownMenuItem(value: 2, child: Text('Thường')), DropdownMenuItem(value: 3, child: Text('Khó'))],
                    onChanged: (v) async { if (v != null) { setState(() => widget.settings.difficulty = v); await widget.settings.save(); } },
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Flutter native • Android • Không cần Flash Player', style: TextStyle(fontSize: 11, color: Colors.white60)),
              ]),
            ),
          )),
        ]),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String text, IconData icon, VoidCallback onTap) =>
      SizedBox(width: double.infinity, height: 54, child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff0677d9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Colors.white30)),
        ),
      ));

  void _openGame(BuildContext context, bool ai) {
    widget.settings.ai = ai;
    Navigator.push(context, MaterialPageRoute(builder: (_) => GameScreen(settings: widget.settings)));
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.settings});
  final GameSettings settings;
  @override State<GameScreen> createState() => _GameState();
}

class _GameState extends State<GameScreen> with SingleTickerProviderStateMixin {
  GameEngine? game;
  late Ticker ticker;
  Duration last = Duration.zero;
  bool paused = false;
  double angle = 45;
  double power = 75;
  ProjectileType weapon = ProjectileType.normal;
  // Âm thanh trúng đạn: phát khi tổng máu 2 bên giảm.
  final AudioPlayer _hitPlayer = AudioPlayer();
  int _prevHpTotal = 200;

  @override
  void initState() {
    super.initState();
    ticker = Ticker((now) {
      if (last == Duration.zero) last = now;
      final dt = ((now - last).inMicroseconds / 1000000).clamp(0.0, .033);
      last = now;
      if (!paused && game != null) {
        game!.update(dt);
        final hpTotal = game!.left.hp + game!.right.hp;
        if (hpTotal < _prevHpTotal && mounted) {
          // Không để lỗi âm thanh (plugin thiếu/trên web) làm crash game.
          _hitPlayer
              .play(AssetSource('sounds/nemda_hit.wav'))
              .catchError((_) {});
        }
        _prevHpTotal = hpTotal;
        if (mounted) setState(() {});
      }
    })..start();
  }

  @override
  void dispose() { _hitPlayer.dispose(); ticker.dispose(); super.dispose(); }

  bool get _canAct =>
      game != null && !game!.finished && game!.shots.isEmpty && game!.current.mode == PlayerMode.human;

  void fire() {
    if (!_canAct) return;
    game!.fire(angleDegrees: angle, power: power, type: weapon);
    setState(() {});
  }

  void reset() { setState(() { game?.reset(); angle = 45; power = 75; weapon = ProjectileType.normal; paused = false; _prevHpTotal = 200; }); }

  /// Di chuyển máy pháo của lượt hiện tại, giới hạn trong sân.
  void _moveFighter(double dx, double dy) {
    if (!_canAct) return;
    final g = game!, f = g.current;
    final nx = (f.position.x + dx).clamp(90.0, g.width - 90.0);
    final ny = (f.position.y + dy).clamp(g.groundY - 240.0, g.groundY);
    setState(() => f.position = math.Point(nx.toDouble(), ny.toDouble()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: LayoutBuilder(builder: (context, _) {
        game ??= GameEngine(width: 1536, height: 1024, aiEnabled: widget.settings.ai, difficulty: GameDifficulty.values[(widget.settings.difficulty - 1).clamp(0,2)]);
        final g = game!;
        return Stack(children: [
          Positioned.fill(child: FittedBox(fit: BoxFit.contain, alignment: Alignment.center, child: SizedBox(width: 1536, height: 1024, child: Stack(children: [
            // Nền màn hình game theo ảnh mẫu nemda_01 (cát + đồi + khung WIND).
            Positioned.fill(child: Image.asset('assets/images/nemda_bg_game.png', fit: BoxFit.fill)),
            Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(color: Colors.black.withOpacity(.08)))),
            // Nhân vật sprite trong suốt, đi theo vị trí engine (= tọa độ artboard).
            Positioned(left: g.left.position.x - 90, top: g.left.position.y - 150,
                child: SpriteActor(character: 'mingming', animation: _spriteAnimation(g, 0), size: 180)),
            Positioned(left: g.right.position.x - 90, top: g.right.position.y - 150,
                child: SpriteActor(character: 'wangtta', animation: _spriteAnimation(g, 1), size: 180, flipX: true)),
            Positioned.fill(child: CustomPaint(painter: BattleOverlayPainter(g, angle, power, widget.settings.showTrajectory, weapon))),

            // --- D-pad di chuyển (trái/phải/lên/xuống) ---
            Positioned(
              left: 45,
              top: 740,
              child: Column(children: [
                _ctrlBtn(Icons.arrow_upward, () => _moveFighter(0, -26)),
                const SizedBox(height: 6),
                Row(children: [
                  _ctrlBtn(Icons.arrow_back, () => _moveFighter(-26, 0)),
                  const SizedBox(width: 14),
                  _ctrlBtn(Icons.arrow_forward, () => _moveFighter(26, 0)),
                ]),
                const SizedBox(height: 6),
                _ctrlBtn(Icons.arrow_downward, () => _moveFighter(0, 26)),
              ]),
            ),

            // --- Thanh chỉnh góc bắn & lực bắn ---
            Positioned(
              left: 340,
              top: 712,
              width: 400,
              child: Column(children: [
                _sliderRow('GÓC', angle, 5, 85, '${angle.round()}°',
                    (v) => setState(() => angle = v)),
                _sliderRow('LỰC', power, 0, 100, '${power.round()}%',
                    (v) => setState(() => power = v)),
              ]),
            ),

            // --- Chọn đạn ---
            Positioned(
              left: 762,
              top: 712,
              width: 200,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final t in ProjectileType.values) _weaponChip(t),
                ],
              ),
            ),

            // --- Nút bắn / chơi lại ---
            Positioned(left: 985, top: 852, child: _bigBtn('BẮN', fire, Colors.red.shade700)),
            Positioned(left: 1305, top: 852, child: _bigBtn('CHƠI LẠI', reset, Colors.blueGrey.shade700)),

            if (paused) Positioned.fill(child: Container(color: Colors.black54, child: const Center(child: Text('TẠM DỪNG', style: TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white)))))
          ])))),
          Positioned(top: 8, left: 8, child: _smallButton(Icons.arrow_back, () => Navigator.pop(context))),
          Positioned(top: 8, right: 8, child: _smallButton(paused ? Icons.play_arrow : Icons.pause, () => setState(() => paused = !paused))),
          if (game?.finished == true)
            Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.82),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.orangeAccent, width: 2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(game!.winner == 0 ? 'MINGMING THẮNG!' : 'WANGTTA THẮNG!',
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.orangeAccent)),
                        const SizedBox(height: 12),
                        FilledButton(onPressed: reset, child: const Text('CHƠI LẠI')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ]);
      })),
    );
  }

  FighterAnimation _spriteAnimation(GameEngine g, int player) {
    final fighter = player == 0 ? g.left : g.right;
    final isCurrent = (player == 0) == g.leftTurn;
    final dead = g.finished && fighter.hp <= 0;
    if (dead) return FighterAnimation.dead;
    if (g.impacts.isNotEmpty && !isCurrent) return FighterAnimation.hit;
    if (g.shots.isNotEmpty && isCurrent) return FighterAnimation.shoot;
    if (isCurrent) return FighterAnimation.aim;
    return FighterAnimation.idle;
  }

  Widget _ctrlBtn(IconData icon, VoidCallback onTap) {
    final enabled = _canAct;
    return Opacity(
      opacity: enabled ? 1 : .35,
      child: Material(
        color: Colors.white.withOpacity(.16),
        shape: const CircleBorder(side: BorderSide(color: Colors.white38)),
        child: InkWell(
          onTap: enabled ? onTap : null,
          customBorder: const CircleBorder(),
          child: Padding(padding: const EdgeInsets.all(12), child: Icon(icon, color: Colors.white, size: 26)),
        ),
      ),
    );
  }

  Widget _sliderRow(String label, double value, double min, double max, String valueText, ValueChanged<double> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.black.withOpacity(.45), borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Text('$label $valueText', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(width: 8),
        Expanded(child: Slider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          divisions: (max - min).round(),
          label: valueText,
          activeColor: Colors.orangeAccent,
          inactiveColor: Colors.white24,
          onChanged: onChanged,
        )),
      ]),
    );
  }

  Widget _weaponChip(ProjectileType t) {
    final selected = weapon == t;
    return ChoiceChip(
      label: Text(_weaponLabel(t), style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: selected ? Colors.black : Colors.white)),
      selected: selected,
      selectedColor: Colors.orangeAccent,
      backgroundColor: Colors.black.withOpacity(.5),
      side: const BorderSide(color: Colors.white24),
      showCheckmark: false,
      visualDensity: VisualDensity.compact,
      onSelected: (_) => setState(() => weapon = t),
    );
  }

  String _weaponLabel(ProjectileType t) => switch (t) {
    ProjectileType.normal => 'THƯỜNG',
    ProjectileType.heavy => 'MẠNH',
    ProjectileType.homing => 'HOMING',
    ProjectileType.split => 'SPLIT',
  };

  Widget _bigBtn(String label, VoidCallback onTap, Color color) {
    final enabled = label != 'BẮN' || _canAct;
    return ElevatedButton(
      onPressed: enabled ? onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        disabledBackgroundColor: color.withOpacity(.35),
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
        textStyle: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
      ),
      child: Text(label),
    );
  }

  Widget _smallButton(IconData icon, VoidCallback onTap) => Material(color: Colors.black54, shape: const CircleBorder(), child: InkWell(onTap: onTap, customBorder: const CircleBorder(), child: Padding(padding: const EdgeInsets.all(10), child: Icon(icon, color: Colors.white))));
}

class BattleOverlayPainter extends CustomPainter {
  BattleOverlayPainter(this.g, this.angle, this.power, this.showTrajectory, this.weapon);
  final GameEngine g; final double angle; final double power; final bool showTrajectory; final ProjectileType weapon;
  @override
  void paint(Canvas c, Size s) {
    // Canvas coordinates use the source 1536x1024 artboard (= engine world).
    _drawWindGauge(c, g.wind);
    // Đường đất ngang tầm 2 nhân vật.
    c.drawLine(Offset(0, g.floorY), Offset(g.width, g.floorY),
        Paint()..color = Colors.white24..strokeWidth = 3);
    _drawStatus(c, g.left, Colors.cyanAccent);
    _drawStatus(c, g.right, Colors.orangeAccent);
    if (showTrajectory && g.current.mode == PlayerMode.human && g.shots.isEmpty && !g.finished) {
      final muzzle = Offset(g.current.position.x + g.current.facing * 40, g.current.position.y - 70);
      final rad = angle * math.pi / 180;
      final speed = 145 + power * 4.2;
      var vx = g.current.facing * speed * math.cos(rad);
      var vy = -speed * math.sin(rad);
      var x = muzzle.dx, y = muzzle.dy;
      final p = Paint()..color = const Color(0xffb88cff)..style = PaintingStyle.fill;
      for (int i=0; i<34; i++) {
        x += vx * .055; y += vy * .055; vy += 315*.055; vx += g.wind*19*.055;
        if (y > g.floorY || x < -70 || x > g.width + 70) break;
        c.drawCircle(Offset(x, y), 3.5, p);
      }
    }
    // Dynamic status strip that remains readable above the reference art.
    final label = 'GÓC ${angle.round()}°   •   LỰC ${power.round()}%   •   ${_weaponName(weapon)}';
    final tp = TextPainter(text: TextSpan(text: label, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white, shadows: [Shadow(color: Colors.black87, blurRadius: 4)])), textDirection: TextDirection.ltr)..layout();
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: const Offset(770, 680), width: tp.width+30, height: 38), const Radius.circular(18)), Paint()..color=Colors.black.withOpacity(.55));
    tp.paint(c, Offset(770-tp.width/2, 680-tp.height/2));
    if (g.shots.isNotEmpty) {
      for (final sh in g.shots) {
        final p = Offset(sh.position.x, sh.position.y);
        final col = sh.type == ProjectileType.homing ? Colors.cyanAccent : sh.type == ProjectileType.heavy ? Colors.orangeAccent : sh.type == ProjectileType.split ? Colors.purpleAccent : Colors.white;
        c.drawCircle(p, sh.type == ProjectileType.heavy ? 10 : 6, Paint()..color=col);
        c.drawCircle(p, sh.type == ProjectileType.heavy ? 20 : 12, Paint()..style=PaintingStyle.stroke..strokeWidth=3..color=col.withOpacity(.35));
      }
    }
    for (final i in g.impacts) {
      c.drawCircle(Offset(i.position.x, i.position.y), i.radius, Paint()..style=PaintingStyle.stroke..strokeWidth=4..color=Colors.orangeAccent.withOpacity((i.life/.45).clamp(0,1)));
    }
  }

  /// Kim chỉ gió giữa-trên màn hình: hướng mũi tên = chiều gió,
  /// độ dài + màu = mạnh/yếu để người chơi canh lực bắn.
  void _drawWindGauge(Canvas c, double wind) {
    const cx = 768.0, cy = 58.0;
    final strength = (wind.abs() / 5.5).clamp(0.0, 1.0);
    final color = Color.lerp(Colors.greenAccent, Colors.redAccent, strength)!;
    // Khung nền
    c.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy), width: 340, height: 74),
            const Radius.circular(20)),
        Paint()..color = Colors.black.withOpacity(.55));
    // Nhãn GIÓ
    final tp = TextPainter(
        text: TextSpan(
            text: 'GIÓ ${wind.abs().toStringAsFixed(1)}',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: color,
                shadows: [Shadow(color: Colors.black87, blurRadius: 4)])),
        textDirection: TextDirection.ltr)
      ..layout();
    tp.paint(c, Offset(cx - tp.width / 2, cy - 30));
    // Trục thước
    c.drawLine(Offset(cx - 130, cy + 16), Offset(cx + 130, cy + 16),
        Paint()..color = Colors.white38..strokeWidth = 3);
    if (wind.abs() < .15) {
      c.drawCircle(Offset(cx, cy + 16), 7, Paint()..color = Colors.white70);
      return;
    }
    final dir = wind > 0 ? 1 : -1;
    final len = 24.0 + strength * 100.0;
    final x2 = cx + dir * len;
    // Thân mũi tên
    c.drawLine(Offset(cx, cy + 16), Offset(x2, cy + 16),
        Paint()..color = color..strokeWidth = 6);
    // Đầu mũi tên
    final head = Path()
      ..moveTo(x2 + dir * 16, cy + 16)
      ..lineTo(x2 - dir * 4, cy + 5)
      ..lineTo(x2 - dir * 4, cy + 27)
      ..close();
    c.drawPath(head, Paint()..color = color);
  }

  /// Thanh máu + tên + khiên phía trên đầu nhân vật (sprite đã vẽ thân).
  void _drawStatus(Canvas c, Fighter f, Color color) {
    final p = Offset(f.position.x, f.position.y - 160);
    if (f.shield) {
      c.drawCircle(p.translate(0, 40), 46, Paint()..style=PaintingStyle.stroke..strokeWidth=3..color=Colors.lightBlueAccent.withOpacity(.55));
    }
    const w = 72.0;
    final hpColor = f.hp > 50 ? Colors.greenAccent : f.hp > 25 ? Colors.orangeAccent : Colors.redAccent;
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: p, width: w+4, height: 12), const Radius.circular(6)), Paint()..color=Colors.black.withOpacity(.55));
    if (f.hp > 0) {
      c.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(p.dx-w/2, p.dy-5, w*f.hp/100, 9), const Radius.circular(4)), Paint()..color=hpColor);
    }
    final nameTp = TextPainter(text: TextSpan(text: '${f.name}  ${f.hp}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: color, shadows: [Shadow(color: Colors.black87, blurRadius: 3)])), textDirection: TextDirection.ltr)..layout();
    nameTp.paint(c, Offset(p.dx - nameTp.width/2, p.dy - 22));
  }
  String _weaponName(ProjectileType t) => switch(t){ ProjectileType.normal=>'ĐẠN THƯỜNG', ProjectileType.heavy=>'ĐẠN MẠNH', ProjectileType.homing=>'HOMING', ProjectileType.split=>'SPLIT'};
  @override bool shouldRepaint(covariant BattleOverlayPainter old) => true;
}
