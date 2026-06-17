import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      context.go('/connection');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(Icons.health_and_safety, size: 100),

            const SizedBox(height: 20),

            Text("SMART", style: Theme.of(context).textTheme.headlineLarge),

            const SizedBox(height: 10),

            const Text(
              "Surgical Monitoring\nand Analytics\nfor Real-Time Tracking",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
