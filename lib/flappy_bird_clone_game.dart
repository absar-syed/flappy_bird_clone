import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird_clone/components/bird.dart';

class FlappyBirdCloneGame extends FlameGame<FlappyBirdCloneWorld> {
  FlappyBirdCloneGame() : super(world: FlappyBirdCloneWorld());
}

//World Class
class FlappyBirdCloneWorld extends World {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(WorldBackground());
    add(Bird());
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
