import 'package:flame/flame.dart';
import 'package:flappy_bird_clone/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flappy Bird Clone',
      home: MainPage(),
    );
  }
}
