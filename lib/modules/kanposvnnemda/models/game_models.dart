import 'dart:math' as math;

enum ProjectileType { normal, heavy, homing, split }
enum ItemType { none, shield, homing, heavy, repair, split }
enum PlayerMode { human, ai }

enum GameDifficulty { easy, normal, hard }

class Fighter {
  Fighter({required this.name, required this.position, required this.facing, this.hp = 100, this.mode = PlayerMode.human});
  final String name;
  math.Point<double> position;
  final double facing;
  int hp;
  int score = 0;
  ItemType item = ItemType.none;
  bool shield = false;
  PlayerMode mode;
}

class Shot {
  Shot({required this.position, required this.velocity, required this.type, this.owner = 0, this.damage = 18});
  math.Point<double> position;
  math.Point<double> velocity;
  final ProjectileType type;
  final int owner;
  final int damage;
  bool active = true;
  double age = 0;
}

class Impact {
  Impact(this.position, {this.life = .45, this.radius = 10});
  math.Point<double> position;
  double life;
  double radius;
}
