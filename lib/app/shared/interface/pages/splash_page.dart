import 'package:flutter/material.dart';

import 'package:rnly/app/shared/shared.dart';
import 'package:rnly/core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          const BG(),
          SafeArea(
            child: Container(
              color: Colors.transparent,
              width: double.maxFinite,
              height: double.maxFinite,
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacings.spacing16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(),
                    Container(
                      height: 90,
                      width: 3,
                      color: Colors.blue.withOpacity(0.8),
                    ),
                    CustomButton(
                      expanded: true,
                      text: 'Test your knowledge',
                      onPressed: () => pushTo(context, const DashboardPage()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
