// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ntigradproject/core/function/app_route.dart';
// import 'package:ntigradproject/core/theme/app_colors.dart';
// import 'package:ntigradproject/core/theme/app_text_style.dart';
// import 'package:ntigradproject/core/utils/app_icon.dart';
// import 'package:ntigradproject/core/utils/app_image.dart';
// import 'package:ntigradproject/core/utils/app_string.dart';
// import 'package:ntigradproject/feature/orders/presentation/my_order_cancel.dart';
// import 'package:ntigradproject/feature/orders/presentation/my_order_complete_view.dart';
// import 'package:ntigradproject/feature/orders/presentation/order_detials_view.dart';
// import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_elv_button.dart';

// class DefaultInfoOrder extends StatelessWidget {
//   const DefaultInfoOrder({
//     super.key,
//     this.isActive = false,
//     this.isCancel = false,
//     this.isCompleted = false,
//   });

//   final bool isActive;

//   final bool isCancel;

//   final bool isCompleted;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => AppRoute.navigateTo(OrderDetailsView()),
//       child: Container(
//         margin: const EdgeInsetsDirectional.only(
//           start: 20,
//           end: 20,
//           bottom: 23,
//         ),
//         width: 350,
//         height: 106,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: MyColors.white,
//           boxShadow: [
//             BoxShadow(
//               color: MyColors.black.withOpacity(0.25),
//               offset: Offset(0, 4),
//               blurRadius: 4,
//             ),
//           ],
//         ),
//         child: Row(
//           textDirection: TextDirection.ltr,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               height: 106,
//               width: 103,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: MyColors.containColCateNonSelect,
//               ),
//               child: Image.asset(AppImage.teshirt),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.symmetric(
//                 horizontal: 11,
//                 vertical: 13,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: 235,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Mens Starry", style: AppTextStyle.regularDark14),
//                         Text("\$ 50", style: AppTextStyle.regulardark12),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 235,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "15/05/2005 1:30 pm",
//                           style: AppTextStyle.regular14,
//                         ),
//                         Text("1 item", style: AppTextStyle.regular12),
//                       ],
//                     ),
//                   ),
//                   isActive
//                       ? defaultInfoOrderActive(context)
//                       : isCompleted
//                       ? defaultInfoOrderComplet()
//                       : defaultInfoOrderCancel(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget defaultInfoOrderActive(BuildContext context) {
//     return SizedBox(
//       width: 250,
//       child: Row(
//         spacing: 7,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           defaultEvelButt(
//             title: AppString.cancel,
//             onPress: () {
//               AppRoute.navigateTo(MyOrdersCancelView());
//             },
//           ),
//           defaultEvelButt(
//             title: AppString.trackDriver,
//             onPress: () {
//               AppRoute.navigateTo(MyOrdersComplView());
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget defaultInfoOrderComplet() {
//     return Row(
//       spacing: 5,
//       children: [
//         SvgPicture.asset(
//           width: 12,
//           height: 12,
//           fit: BoxFit.fill,
//           AppIcon.correct,
//         ),
//         Text(AppString.deleveryOrder, style: AppTextStyle.regular14),
//       ],
//     );
//   }

//   Widget defaultInfoOrderCancel() {
//     return Row(
//       spacing: 5,
//       children: [
//         SvgPicture.asset(
//           width: 12,
//           height: 12,
//           fit: BoxFit.fill,
//           AppIcon.cancel,
//         ),
//         Text(AppString.orderCancel, style: AppTextStyle.regular14),
//       ],
//     );
//   }
// }
