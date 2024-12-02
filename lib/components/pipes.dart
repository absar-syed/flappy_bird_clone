import 'dart:async';
import 'dart:ui';
import 'package:flame/components.dart';

class Pipes extends PositionComponent {

  Pipes({
    required this.flippedPipe, 
    required super.position
  });

  late Sprite _pipeSprite;
  final bool flippedPipe;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _pipeSprite = await Sprite.load('pipe.png');
    size = Vector2(56, 600);
    anchor = Anchor.topCenter;
    if (flippedPipe) {
      flipVertically();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _pipeSprite.render(canvas);
  }
}


class PipePair extends PositionComponent {
  PipePair({required super.position, this.gap = 125, this.speed = 100});

  final double gap;

  final double speed;

  @override
  void onLoad() {
    super.onLoad();
    addAll([
      Pipes(
        flippedPipe: true, 
        position: Vector2(0, -gap)
      ), 
      Pipes(
        flippedPipe: false, 
        position: Vector2(0, gap)
      )
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= speed * dt;
  }
}
