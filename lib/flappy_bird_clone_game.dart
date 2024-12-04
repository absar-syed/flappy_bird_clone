import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird_clone/components/bird.dart';
import 'package:flappy_bird_clone/components/pipes.dart';

class FlappyBirdCloneGame extends FlameGame<FlappyBirdCloneWorld>
    with HasCollisionDetection {
  FlappyBirdCloneGame() : super(world: FlappyBirdCloneWorld());
}

//World Class
class FlappyBirdCloneWorld extends World
    with TapCallbacks, HasGameRef<FlappyBirdCloneGame> {
  late Bird _bird;
  late PipePair _lastPipe;
  int _coins = 0;
  late TextComponent _totalCoins;
  // var _totalCoins;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(WorldBackground());
    _generatePipes();
    add(_bird = Bird());
    game.camera.viewfinder.add(_totalCoins = TextComponent(
        text: "Coins: $_coins", position: Vector2(0, -(game.size.y / 2)), size: Vector2.all(40)));
    //  game.camera.viewfinder.zoom = 0.05;
  }

  void _generatePipes({double distance = 250}) {
    for (var i = 1; i < 5; i++) {
      const area = 600;
      final y = (Random().nextDouble() * area) - (area / 2);
      add(_lastPipe = PipePair(position: Vector2(i * distance, y)));
    }
  }

  void _removePipes() {
    final pipes = children.whereType<PipePair>();
    final remove = max(pipes.length - 5, 0);
    pipes.take(remove).forEach((pipe) {
      pipe.removeFromParent();
    });
  }

  void increaseCoins() {
    _coins += 1;
  }

  @override
  void update(double dt) {
    super.update(dt);
    _totalCoins.text = "Coins: $_coins";
    if (_bird.x >= _lastPipe.x) {
      _generatePipes();
    }
    _removePipes();

    
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _bird.jump();
  }
}

class WorldBackground extends ParallaxComponent<FlappyBirdCloneGame> {
  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await game.loadParallax([ParallaxImageData('sky.png')],
        baseVelocity: Vector2(75, 0));
  }
}
