import 'package:flutter/material.dart';
import 'package:listngo/screens/choose_role_screen.dart';
import 'package:listngo/widgets/intro_page_1.dart';
import 'package:listngo/widgets/intro_page_2.dart';
import 'package:listngo/widgets/intro_page_3.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          SizedBox(
            height: size.height * 0.7,
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  onLastPage = (value == 2);
                });
              },
              controller: _controller,
              children: const [IntroPage1(), IntroPage2(), IntroPage3()],
            ),
          ),
          Container(
            // height: 200,
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // GestureDetector(
                //     child: const Text('Skip'),
                //     onTap: () {
                //       _controller.jumpToPage(2);
                //     }),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color.fromARGB(255, 216, 197, 240),
                    activeDotColor: Color.fromARGB(255, 149, 86, 225),
                    dotHeight: 10,
                  ),
                ),
                onLastPage
                    ? CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(181, 216, 197, 240),
                        radius: 30,
                        child: IconButton(
                          onPressed: () {
                            setState(() {});
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ChooseRoleScreen();
                            }));
                          },
                          icon: const Icon(Icons.done),
                          iconSize: 40,
                          color: Colors.black,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(181, 216, 197, 240),
                        radius: 30,
                        child: IconButton(
                          onPressed: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          icon: const Icon(Icons.navigate_next),
                          iconSize: 40,
                          color: Colors.black,
                        ),
                      )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.07,
          )
        ],
      ),
    );
  }
}
