import 'package:flutter/material.dart';
import 'package:rnly/app/shared/shared.dart';

class Logo extends StatelessWidget {
  final double? size;
  final bool useHero;
  final IconData? ratherIcon;
  const Logo({
    Key? key,
    this.size,
    this.useHero = true,
    this.ratherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: "logo",
        child: SizedBox(
          width: size,
          height: size,
          child: FittedBox(
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: blue.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  ratherIcon ?? Icons.menu_book_rounded,
                  size: 120,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
