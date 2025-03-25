// import 'package:flutter/material.dart';
// import 'package:ntigradproject/core/function/app_route.dart';
// import 'package:ntigradproject/core/theme/app_colors.dart';
// import 'package:ntigradproject/core/utils/app_string.dart';
// import 'package:ntigradproject/feature/orders/presentation/my_order_cancel.dart';
// import 'package:ntigradproject/feature/orders/presentation/my_order_complete_view.dart';
// import 'package:ntigradproject/feature/orders/presentation/myorder_achieve_view.dart';
// import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_elvauted_button.dart';

// Widget categorySelectWidget(
//   BuildContext context, {
//   bool isActive = false,
//   bool isCompleted = false,
//   bool isCancelled = false,
// }) {
//   return Padding(
//     padding: const EdgeInsetsDirectional.only(start: 26, end: 26, top: 40),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       spacing: 6,
//       children: [
//         DefaultElevatedButton(
//           title: AppString.active,
//           textColor: isActive ? MyColors.white : MyColors.red,
//           onPressed: () {
//             AppRoute.navigateTo(MyOrdersActiveViews());
//           },
//           containerColor:
//               isActive ? MyColors.red : MyColors.containColCateNonSelect,
//         ),
//         DefaultElevatedButton(
//           title: AppString.completed,
//           textColor: isCompleted ? MyColors.white : MyColors.red,
//           onPressed: () {
//             AppRoute.navigateTo(MyOrdersComplView());
//           },
//           containerColor:
//               isCompleted ? MyColors.red : MyColors.containColCateNonSelect,
//         ),
//         DefaultElevatedButton(
//           title: AppString.cancel,
//           textColor: isCancelled ? MyColors.white : MyColors.red,
//           onPressed: () {
//             AppRoute.navigateTo(MyOrdersCancelView());
//           },
//           containerColor:
//               isCancelled ? MyColors.red : MyColors.containColCateNonSelect,
//         ),
//       ],
//     ),
//   );
// }
