import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/features/authentication/screens/onboarding/widgets/board.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  bool onLastPage = false;

  List images = [
    'assets/images/image 1.jpg',
    'assets/images/image 2.jpg',
    'assets/images/image 3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6E5340),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              CustomBoard(
                image: "assets/images/image 1.jpg",
                title: 'Discover the wonders of Egypt!',
              ),
              CustomBoard(
                image: "assets/images/image 2.jpg",
                title: 'Get insider tips and recommendations',
              ),
              CustomBoard(
                image: "assets/images/image 3.jpg",
                title:
                    'Find the best hotels, Restaurants and activities, all in one place.',
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'WelcomeScreen');
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                    const SizedBox(
                      width: 120,
                    ),
                    onLastPage
                        ? CElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'WelcomeScreen');
                            },
                            child: const Text('done'),
                          )
                        : CElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            radius: 20,
                            padding: const EdgeInsets.symmetric(horizontal:30),
                            child: const Row(children: [
                              Text("Next"),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: CSizes.iconSm,
                              )
                            ]),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
          //for the 3 points
          Container(
            alignment: const Alignment(0, .80),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: Colors.white,
                  activeDotColor: CColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
