import 'dart:math' as math;
import '../models/game_models.dart';

class GameEngine {
  GameEngine({required this.width, required this.height, this.aiEnabled = true, this.difficulty = GameDifficulty.normal}) { reset(); }
  final double width, height;
  final bool aiEnabled;
  final GameDifficulty difficulty;
  final math.Random random = math.Random();
  late Fighter left;
  late Fighter right;
  final List<Shot> shots = [];
  final List<Impact> impacts = [];
  double wind = 0;
  bool leftTurn = true, finished = false;
  int turn = 1;
  int winner = -1;
  double time = 0;

  Fighter get current => leftTurn ? left : right;
  Fighter get target => leftTurn ? right : left;

  /// Đường đất — ngang tầm 2 nhân vật minh họa trên artboard (đỡ thấp hơn đáy).
  double get groundY => height * 0.52;
  double get floorY => groundY + 34;

  void reset() {
    left = Fighter(name: 'MINGMING', position: math.Point(85.0, groundY), facing: 1);
    right = Fighter(name: 'WANGTTA', position: math.Point(width - 85, groundY), facing: -1, mode: aiEnabled ? PlayerMode.ai : PlayerMode.human);
    shots.clear(); impacts.clear();
    wind = _newWind(); leftTurn = true; finished = false; turn = 1; winner = -1; time = 0;
  }

  double _newWind() => (random.nextDouble() * 2 - 1) * 5.5;

  void fire({required double angleDegrees, required double power, ProjectileType? type}) {
    if (finished || shots.isNotEmpty) return;
    final f = current;
    final selected = type ?? _itemProjectile(f.item);
    final rad = angleDegrees * math.pi / 180;
    final speed = 145 + power * 4.2;
    final damage = switch (selected) { ProjectileType.heavy => 30, ProjectileType.homing => 22, ProjectileType.split => 15, _ => 18 };
    shots.add(Shot(position: math.Point(f.position.x + f.facing * 24, f.position.y - 12), velocity: math.Point(f.facing * speed * math.cos(rad), -speed * math.sin(rad)), type: selected, owner: leftTurn ? 0 : 1, damage: damage));
    f.item = ItemType.none;
  }

  ProjectileType _itemProjectile(ItemType item) => switch (item) {
    ItemType.homing => ProjectileType.homing,
    ItemType.heavy => ProjectileType.heavy,
    ItemType.split => ProjectileType.split,
    _ => ProjectileType.normal,
  };

  void endTurn() {
    if (finished || shots.isNotEmpty) return;
    leftTurn = !leftTurn;
    turn++;
    wind = _newWind();
    _maybeGiveItem(current);
  }

  void _maybeGiveItem(Fighter f) {
    if (random.nextDouble() < .38) {
      final pool = [ItemType.shield, ItemType.homing, ItemType.heavy, ItemType.repair, ItemType.split];
      f.item = pool[random.nextInt(pool.length)];
      if (f.item == ItemType.shield) f.shield = true;
    }
  }

  void update(double dt) {
    if (finished) return;
    final hadFlight = shots.isNotEmpty;
    time += dt;
    if (shots.isEmpty && current.mode == PlayerMode.ai) _aiFire();
    for (final s in List<Shot>.from(shots)) {
      if (!s.active) continue;
      s.age += dt;
      var vx = s.velocity.x + wind * 19 * dt;
      var vy = s.velocity.y + 315 * dt;
      if (s.type == ProjectileType.homing && s.age > .12) {
        final t = targetForOwner(s.owner);
        final dx = t.position.x - s.position.x, dy = t.position.y - s.position.y;
        final len = math.sqrt(dx * dx + dy * dy);
        if (len > 1) { vx += dx / len * 145 * dt; vy += dy / len * 145 * dt; }
      }
      s.velocity = math.Point(vx, vy);
      s.position = math.Point(s.position.x + vx * dt, s.position.y + vy * dt);
      if (s.position.y >= floorY) { _explode(s); continue; }
      if (s.position.x < -70 || s.position.x > width + 70 || s.age > 8) { s.active = false; continue; }
      final victim = s.owner == 0 ? right : left;
      final dx = s.position.x - victim.position.x, dy = s.position.y - victim.position.y;
      final radius = s.type == ProjectileType.heavy ? 38 : 29;
      if (dx * dx + dy * dy < radius * radius) { damage(victim, s.damage); _explode(s); }
    }
    shots.removeWhere((s) => !s.active);
    if (hadFlight && shots.isEmpty && !finished) endTurn();
    for (final i in impacts) { i.life -= dt; i.radius += 90 * dt; }
    impacts.removeWhere((i) => i.life <= 0);
  }

  Fighter targetForOwner(int owner) => owner == 0 ? right : left;

  void _explode(Shot s) {
    s.active = false;
    impacts.add(Impact(s.position, radius: s.type == ProjectileType.heavy ? 16 : 9));
    if (s.type == ProjectileType.split && s.age < 1.5) {
      final a = s.velocity;
      for (final sign in [-1, 1]) {
        final v = math.Point(a.x * .55, a.y + sign * 85);
        shots.add(Shot(position: s.position, velocity: v, type: ProjectileType.normal, owner: s.owner, damage: s.damage));
      }
    }
  }

  void damage(Fighter f, int amount) {
    if (f.shield) { f.shield = false; return; }
    f.hp = math.max(0, f.hp - amount);
    if (f.hp == 0) {
      finished = true;
      winner = f == left ? 1 : 0;
      (winner == 0 ? left : right).score++;
    }
  }

  void giveItem(ItemType item) {
    current.item = item;
    if (item == ItemType.shield) current.shield = true;
    if (item == ItemType.repair) current.hp = math.min(100, current.hp + 22);
  }

  void _aiFire() {
    final dx = (left.position.x - right.position.x).abs();
    final difficultyBonus = switch (difficulty) { GameDifficulty.easy => 0.75, GameDifficulty.normal => 1.0, GameDifficulty.hard => 1.18 };
    final base = difficulty == GameDifficulty.hard ? 38 : 30;
    final angle = (base + random.nextDouble() * 28).clamp(12, 75).toDouble();
    final power = (48 + dx / width * 43 + random.nextDouble() * 9).clamp(20, 100).toDouble();
    final type = current.item == ItemType.none || random.nextDouble() > difficultyBonus * .35 ? ProjectileType.normal : _itemProjectile(current.item);
    fire(angleDegrees: angle, power: power, type: type);
  }
}
