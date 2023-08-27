import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // controller
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  // а так же избавиться от контроллера
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  // текущий момент

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(150),
            child: GestureDetector(
              onTap: () {
                if (bookmarked == false) {
                  bookmarked = true;
                  _controller.forward();
                } else {
                  bookmarked = false;
                  _controller.reverse();
                }
              },
              child: Lottie.network(
                "https://lottie.host/2e5d38a0-8d90-4e79-bf84-664d84d3fda3/W7yol4saw3.json",
                controller: _controller,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

// https://asset-cdn.lottiefiles
