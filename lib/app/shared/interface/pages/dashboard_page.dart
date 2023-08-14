import 'package:flutter/material.dart';

import 'package:rnly/app/shared/shared.dart';
import 'package:rnly/core/core.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          const Opacity(
            opacity: 0.4,
            child: BG(),
          ),
          SafeArea(
            child: Column(
              children: [
                const Logo(
                  size: 50,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   child: Center(
                        //     child: Text(
                        //       "No quiz score data yet",
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(
                        //         color: white,
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Personal Best Score!",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "23",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 75,
                                  ),
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      DashboardItem(
                        icon: Icons.mobile_friendly_outlined,
                        subText: "Test your Flutter Knowledge",
                        mainText: "Flutter Quiz",
                        color: blue.withOpacity(0.2),
                        onTap: () =>
                            pushTo(context, const PrepQuizPage('Flutter')),
                      ),
                      DashboardItem(
                        icon: Icons.computer,
                        subText: "Test your HTML knowledge",
                        mainText: "HTML Quiz",
                        onTap: () =>
                            pushTo(context, const PrepQuizPage('HTML')),
                      ),
                      DashboardItem(
                        icon: Icons.exit_to_app_rounded,
                        subText: "It's not bye bye, come back.",
                        mainText: "Sign Out",
                        onTap: () =>
                            pushToAndClearStack(context, const SplashPage()),
                        color: red.withOpacity(0.2),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
