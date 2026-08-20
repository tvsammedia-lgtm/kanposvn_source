import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../game/game_engine.dart';
import '../models/game_models.dart';
import '../services/settings_service.dart';
import '../../../../core/router/module_selector_screen.dart';
import '../../../../core/providers.dart';

class NemdaHomeScreen extends ConsumerStatefulWidget {
  const NemdaHomeScreen({super.key});
  @override
  ConsumerState<NemdaHomeScreen> createState() => _NemdaHomeScreenState();
}

class _NemdaHomeScreenState extends ConsumerState<NemdaHomeScreen> {
  GameSettings? _settings;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    GameSettings.load().then((s) {
      if (mounted) setState(() { _settings = s; _loading = false; });
    });
  }

  Future<void> _save() async => _settings?.save();

  void _exitToLogin() {
    ref.read(authServiceProvider).signOut();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final settings = _settings!;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff080d1d), Color(0xff24134a), Color(0xff0b2440)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 460), child: Column(children: [
          Container(width: 100, height: 100, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(.08), border: Border.all(color: Colors.white24)), child: const Icon(Icons.sports_esports, size: 54)),
          const SizedBox(height: 18), const Text('CHƠI NHAU', style: TextStyle(fontSize: 46, fontWeight: FontWeight.w900, letterSpacing: 3)),
          const Text('ANDROID • FLUTTER EDITION', style: TextStyle(letterSpacing: 2, color: Colors.white60)), const SizedBox(height: 36),
          SizedBox(width: double.infinity, height: 56, child: FilledButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NemdaGameScreen(settings: settings))),
            icon: const Icon(Icons.play_arrow),
            label: Text(settings.ai ? 'ĐẤU VỚI MÁY' : 'CHƠI 2 NGƯỜI', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          )),
          const SizedBox(height: 12), Card(child: Padding(padding: const EdgeInsets.all(8), child: Column(children: [
            SwitchListTile(title: const Text('Đấu với máy'), subtitle: Text(settings.ai ? 'Wangtta điều khiển bởi AI' : 'Hai người dùng chung thiết bị'), value: settings.ai, onChanged: (v) { setState(() => settings.ai = v); _save(); }),
            ListTile(title: const Text('Độ khó AI'), trailing: DropdownButton<int>(value: settings.difficulty, items: const [DropdownMenuItem(value: 1, child: Text('Dễ')), DropdownMenuItem(value: 2, child: Text('Thường')), DropdownMenuItem(value: 3, child: Text('Khó'))], onChanged: settings.ai ? (v) { if (v != null) { setState(() => settings.difficulty = v); _save(); } } : null)),
            SwitchListTile(title: const Text('Âm thanh'), value: settings.sound, onChanged: (v) { setState(() => settings.sound = v); _save(); }),
          ]))),
          const SizedBox(height: 18), const Text('Gió • vật lý đạn • Homing • Heavy • Split • Shield • Item', textAlign: TextAlign.center, style: TextStyle(color: Colors.white60)),
          const SizedBox(height: 8), const Text('Clean-room recreation • Không cần Flash Player', style: TextStyle(color: Colors.white38, fontSize: 12)),
        ]))))),
      ),
    );
  }
}

class NemdaGameScreen extends StatefulWidget {
  const NemdaGameScreen({super.key, required this.settings});
  final GameSettings settings;
  @override
  State<NemdaGameScreen> createState() => _NemdaGameState();
}

class _NemdaGameState extends State<NemdaGameScreen> with SingleTickerProviderStateMixin {
  GameEngine? game; late Ticker ticker; Duration last = Duration.zero; bool paused = false; double angle = 38, power = 65;
  @override void initState() { super.initState(); ticker = Ticker((now) { if (last == Duration.zero) last = now; final dt = ((now - last).inMicroseconds / 1000000).clamp(0.0, .033); last = now; if (!paused && game != null) { game!.update(dt); if (mounted) setState(() {}); } })..start(); }
  @override void dispose() { ticker.dispose(); super.dispose(); }
  void fire() { if (game == null || game!.finished || game!.shots.isNotEmpty) return; game!.fire(angleDegrees: angle, power: power); setState(() {}); }
  @override Widget build(BuildContext context) => Scaffold(backgroundColor: const Color(0xff070b15), body: SafeArea(child: LayoutBuilder(builder: (context, c) { final h = math.max(280.0, c.maxHeight - 175); final diff = GameDifficulty.values[(widget.settings.difficulty - 1).clamp(0, 2)]; if (game == null || game!.width != c.maxWidth || game!.height != h) game = GameEngine(width: c.maxWidth, height: h, aiEnabled: widget.settings.ai, difficulty: diff); return Column(children: [_hud(), Expanded(child: GestureDetector(onPanUpdate: (d) { angle = (angle - d.delta.dy * .25).clamp(8, 82); power = (power + d.delta.dx * .2).clamp(15, 100); }, onTap: fire, child: CustomPaint(painter: NemdaArenaPainter(game!), child: const SizedBox.expand()))), _controls()]); })));
  Widget _hud() => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5), child: Row(children: [Expanded(child: _hp('MINGMING', game?.left.hp ?? 100)), Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white10), child: Column(children: [Text('Gió ${(game?.wind ?? 0).toStringAsFixed(1)}'), Text('Lượt ${game?.turn ?? 1}', style: const TextStyle(fontSize: 11, color: Colors.white54))])), Expanded(child: _hp('WANGTTA', game?.right.hp ?? 100, right: true)), IconButton(onPressed: () => setState(() => paused = !paused), icon: Icon(paused ? Icons.play_arrow : Icons.pause))]));
  Widget _hp(String n, int hp, {bool right = false}) => Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Column(crossAxisAlignment: right ? CrossAxisAlignment.end : CrossAxisAlignment.start, children: [Text('$n  $hp', style: const TextStyle(fontWeight: FontWeight.bold)), LinearProgressIndicator(value: hp / 100, minHeight: 6)]));
  Widget _controls() => Container(padding: const EdgeInsets.fromLTRB(10, 2, 10, 8), child: Column(children: [Row(children: [const SizedBox(width: 38, child: Text('GÓC')), Expanded(child: Slider(value: angle, min: 8, max: 82, onChanged: (v) => setState(() => angle = v))), Text('${angle.round()}°')]), Row(children: [const SizedBox(width: 38, child: Text('LỰC')), Expanded(child: Slider(value: power, min: 15, max: 100, onChanged: (v) => setState(() => power = v))), Text('${power.round()}')]), Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [FilledButton.icon(onPressed: (game?.finished ?? false) ? null : fire, icon: const Icon(Icons.flash_on), label: const Text('BẮN')), OutlinedButton(onPressed: () => setState(() => game?.giveItem(ItemType.homing)), child: const Text('HOMING')), OutlinedButton(onPressed: () => setState(() => game?.giveItem(ItemType.shield)), child: const Text('SHIELD')), OutlinedButton(onPressed: () => setState(() => game?.giveItem(ItemType.repair)), child: const Text('HEAL')), IconButton(onPressed: () => setState(() => game?.reset()), icon: const Icon(Icons.refresh)), OutlinedButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false), child: const Text('THOÁT'), style: OutlinedButton.styleFrom(foregroundColor: Colors.red))]) ]));
}

class NemdaArenaPainter extends CustomPainter { NemdaArenaPainter(this.g); final GameEngine g;
  @override void paint(Canvas c, Size s) { final bg = Paint()..shader = const LinearGradient(colors: [Color(0xff17234a), Color(0xff07101e)]).createShader(Offset.zero & s); c.drawRect(Offset.zero & s, bg); _stars(c, s); _wind(c, s); _ground(c, s); _fighter(c, g.left, true); _fighter(c, g.right, false); for (final sh in g.shots) { final p = Offset(sh.position.x, sh.position.y); final color = sh.type == ProjectileType.homing ? Colors.cyanAccent : sh.type == ProjectileType.heavy ? Colors.deepOrange : sh.type == ProjectileType.split ? Colors.purpleAccent : Colors.amber; c.drawCircle(p, sh.type == ProjectileType.heavy ? 9 : 6, Paint()..color = color); c.drawCircle(p, sh.type == ProjectileType.heavy ? 17 : 11, Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = color.withOpacity(.35)); } for (final i in g.impacts) c.drawCircle(Offset(i.position.x, i.position.y), i.radius, Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Colors.orangeAccent.withOpacity(i.life / .45)); if (g.finished) _overlay(c, s); }
  void _stars(Canvas c, Size s) { final p = Paint()..color = Colors.white24; for (int i = 0; i < 55; i++) { final x = (i * 83) % s.width, y = (i * 47) % math.max(1, s.height * .55); c.drawCircle(Offset(x.toDouble(), y.toDouble()), i % 3 == 0 ? 1.5 : .8, p); } }
  void _wind(Canvas c, Size s) { final x = s.width / 2, y = 30.0, dir = g.wind >= 0 ? 1 : -1; final p = Paint()..color = Colors.white54..strokeWidth = 2; c.drawLine(Offset(x - 30 * dir, y), Offset(x + 30 * dir, y), p); c.drawLine(Offset(x + 30 * dir, y), Offset(x + 19 * dir, y - 6), p); c.drawLine(Offset(x + 30 * dir, y), Offset(x + 19 * dir, y + 6), p); }
  void _ground(Canvas c, Size s) { final path = Path()..moveTo(0, s.height - 45); for (double x = 0; x <= s.width; x += 20) path.lineTo(x, s.height - 45 - math.sin(x * .035) * 9 - math.sin(x * .011) * 5); path.lineTo(s.width, s.height); path.lineTo(0, s.height); path.close(); c.drawPath(path, Paint()..color = const Color(0xff33452f)); }
  void _fighter(Canvas c, Fighter f, bool left) { final p = Offset(f.position.x, f.position.y); final body = Paint()..color = left ? const Color(0xff29c7ff) : const Color(0xffff4e99); c.drawCircle(p, 23, body); c.drawCircle(Offset(p.dx + (left ? 7 : -7), p.dy - 5), 4, Paint()..color = Colors.white); c.drawLine(p, Offset(p.dx + f.facing * 31, p.dy - 19), Paint()..color = Colors.white..strokeWidth = 5); if (f.shield) c.drawCircle(p, 34, Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Colors.cyanAccent); if (f.item != ItemType.none) { c.drawCircle(Offset(p.dx, p.dy - 38), 7, Paint()..color = Colors.amber); } }
  void _overlay(Canvas c, Size s) { c.drawRect(Offset.zero & s, Paint()..color = Colors.black54); final text = g.winner == 0 ? 'MINGMING THẮNG' : 'WANGTTA THẮNG'; final tp = TextPainter(text: TextSpan(text: text, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white)), textDirection: TextDirection.ltr)..layout(); tp.paint(c, Offset((s.width - tp.width) / 2, s.height / 2 - 30)); }
  @override bool shouldRepaint(covariant NemdaArenaPainter old) => true;
}
