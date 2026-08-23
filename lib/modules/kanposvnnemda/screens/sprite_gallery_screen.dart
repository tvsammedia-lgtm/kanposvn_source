import 'package:flutter/material.dart';
import 'sprite_actor.dart';

class SpriteGalleryScreen extends StatelessWidget {
  const SpriteGalleryScreen({super.key});

  static const states = <FighterAnimation>[
    FighterAnimation.idle,
    FighterAnimation.walk,
    FighterAnimation.run,
    FighterAnimation.aim,
    FighterAnimation.shoot,
    FighterAnimation.hit,
    FighterAnimation.fall,
    FighterAnimation.dead,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SPRITE ANIMATION LAB')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: states.length * 2,
        itemBuilder: (_, index) {
          final character = index.isEven ? 'mingming' : 'wangtta';
          final animation = states[index ~/ 2];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('${character.toUpperCase()} • ${animation.name.toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.w900)),
                ),
                Expanded(child: Center(child: SpriteActor(character: character, animation: animation, size: 170, flipX: character == 'wangtta'))),
              ],
            ),
          );
        },
      ),
    );
  }
}
