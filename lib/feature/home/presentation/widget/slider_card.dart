// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ntigradproject/core/utils/app_image.dart';
// import 'package:ntigradproject/feature/home/data/models/silder/slider.dart';
// import 'package:ntigradproject/feature/home/manage/slider/slider_cubit.dart';

// class DiscountSlider extends StatefulWidget {
//   const DiscountSlider({super.key});

//   @override
//   _DiscountSliderState createState() => _DiscountSliderState();
// }

// class _DiscountSliderState extends State<DiscountSlider> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     context.read<SliderCubit>().getSliderData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SliderCubit, SliderState>(
//       builder: (context, state) {
//         if (state is SliderLoadingState) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is SliderFailureState) {
//           return Center(child: Text("❌ خطأ: ${state.errMessage}"));
//         } else if (state is SliderSuccessState) {
//           final List<OfferSlider> sliders = state.sliderData.sliders ?? [];

//           if (sliders.isEmpty) {
//             return const Center(child: Text("🚫 لا يوجد عروض متاحة حالياً"));
//           }

//           return Column(
//             children: [
//               SizedBox(
//                 height: 150,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: sliders.length,
//                   onPageChanged: (index) {
//                     setState(() {
//                       _currentPage = index;
//                     });
//                   },
//                   itemBuilder: (context, index) {
//                     return DiscountCard(
//                       title: sliders[index].title ?? "عرض خاص!",
//                       description:
//                           sliders[index].description ?? "احصل على أفضل العروض",
//                       image:
//                           (sliders[index].imagePath?.isNotEmpty ?? false)
//                               ? sliders[index].imagePath!
//                               : AppImage.gift,
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   sliders.length,
//                   (index) => AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     margin: const EdgeInsets.symmetric(horizontal: 5),
//                     width: _currentPage == index ? 20 : 10,
//                     height: 5,
//                     decoration: BoxDecoration(
//                       color:
//                           _currentPage == index
//                               ? Colors.orange
//                               : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//         return const SizedBox(); // Default fallback
//       },
//     );
//   }
// }

// class DiscountCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String image;

//   const DiscountCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.orange,
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     description,
//                     style: const TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               image,
//               width: 210,
//               height: 150,
//               fit: BoxFit.cover,
//               errorBuilder:
//                   (context, error, stackTrace) => Image.asset(
//                     AppImage.getstart,
//                     width: 210,
//                     height: 150,
//                     fit: BoxFit.cover,
//                   ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
