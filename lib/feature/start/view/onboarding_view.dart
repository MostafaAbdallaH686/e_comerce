import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ntigradproject/core/function/app_width_height.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/start/view/get-start_view.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const GetStartView()));
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return SvgPicture.asset(
      assetName,
      width: AppWidthHeight.persantageOfWidth((350 / 375) * 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = AppTextStyle.onboardingtext;

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.125,
      ),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: TextButton(
              onPressed: () {
                _onIntroEnd(context);
              },
              child: Text('Skip'),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Choose Products",
          body: AppString.onboardingtext,
          image: _buildImage(
            AppIcon.start1,
            AppWidthHeight.persantageOfWidth((350 / 375) * 100),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Make Payment",
          body: AppString.onboardingtext,
          image: _buildImage(
            AppIcon.salesconsulting1,
            AppWidthHeight.persantageOfWidth((350 / 375) * 100),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get Your Order",
          body: AppString.onboardingtext,
          image: _buildImage(
            AppIcon.shoppingbag1,
            AppWidthHeight.persantageOfWidth((350 / 375) * 100),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () {}, // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,

      //rtl: true, // Display as right-to-left
      back: const Text('Prev', style: TextStyle(fontWeight: FontWeight.w600)),
      //skip:
      next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding:
          kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(40.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
