import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';

import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/feature/home/presentation/home_view.dart';
import 'package:ntigradproject/feature/item/presentation/item_view.dart';
import 'package:ntigradproject/feature/profile/presenation/widget/main_profile.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  int navBarCurrentIndex = 0;
  List<Widget> screens = [FinalHomeView(), ItemsView(), MainProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 25,
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.red,
            shape: BoxShape.circle,
            border: Border.all(color: MyColors.red),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcon.bag, fit: BoxFit.cover),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            navBarCurrentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: navBarCurrentIndex == 0 ? Colors.red : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_checkout,
              color: navBarCurrentIndex == 1 ? Colors.red : Colors.black,
            ),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2,
              color: navBarCurrentIndex == 2 ? Colors.red : Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[navBarCurrentIndex],
    );
  }
}

// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('profile'));
//   }
// }

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   CarouselSliderController buttonCarouselController =
//       CarouselSliderController();

//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 100),
//             SizedBox(
//               width: 200,
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: CircleAvatar(
//                       radius: 100,
//                       backgroundImage: AssetImage(AppImage.getstart),
//                     ),
//                   ),

//                   Align(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     child: CircleAvatar(
//                       radius: 35,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundColor: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 100),
//             CarouselSlider(
//               carouselController: buttonCarouselController,
//               options: CarouselOptions(
//                 // reverse: true,
//                 height: 300.0,
//                 autoPlay: true,
//                 aspectRatio: 1,
//                 viewportFraction: 1,
//                 autoPlayCurve: Curves.slowMiddle,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     currentIndex = index;
//                   });
//                 },
//               ),
//               items:
//                   [1, 2, 3, 4, 5].map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           width: MediaQuery.of(context).size.width,
//                           margin: EdgeInsets.symmetric(horizontal: 5.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.amber,
//                             image: DecorationImage(
//                               image: AssetImage(AppImage.getstart),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Text(
//                             'text $i',
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//             ),
//             DotsIndicator(dotsCount: 5, position: currentIndex.toDouble()),
//           ],
//         ),
//       ),
//     );
//   }
// }
