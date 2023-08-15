import 'package:flutter/material.dart';
import 'package:rnly/app/modules/quiz/presentation/pages/flutter_quiz_page.dart';
import 'package:rnly/app/modules/quiz/presentation/pages/html_quiz_page.dart';
import 'package:rnly/app/shared/shared.dart';
import 'package:rnly/core/core.dart';

class PrepQuizPage extends StatefulWidget {
  final String title;
  const PrepQuizPage(this.title, {super.key});

  @override
  State<PrepQuizPage> createState() => _PrepQuizPageState();
}

class _PrepQuizPageState extends State<PrepQuizPage> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        "${widget.title} Knowledge Quiz",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Basic and Intermediate Questions to Assess Comprehension of Core Concepts",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Remember to pause and take a deep breath – you've got this!",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
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
                        subText: "Take Quiz!",
                        mainText: "Begin",
                        color: blue.withOpacity(0.2),
                        onTap: () {
                          Widget page = const FlutterQuizPage();
                          if (widget.title == 'HTML') {
                            page = const HtmlQuizPage();
                          }
                          pushTo(context, page);
                        },
                      ),
                      DashboardItem(
                        icon: Icons.exit_to_app_rounded,
                        subText: "Still need more practice!",
                        mainText: "Not now",
                        onTap: () => pop(context),
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
