import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Bird extends SpriteAnimationComponent {
  Bird() : super(size: Vector2(100, 120), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    var spriteImage = await Flame.images.load('yellow_bird.png');
    final spriteSheet =
        SpriteSheet(image: spriteImage, srcSize: Vector2(52, 43), margin: 2.3, spacing: 5);
    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.1, from: 0, to: 2 );
  }
}
